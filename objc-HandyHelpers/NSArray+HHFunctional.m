//
//  NSArray+OCArray.m
//  dogo
//
//  Created by Marcus Westin on 1/27/13.
//  Copyright (c) 2013 Flutterby. All rights reserved.
//

#import "NSArray+HHFunctional.h"

@implementation NSArray (HHFunctional)

- (NSMutableArray*) map:(HHSyncIterate)iterate {
    NSUInteger count = [self count];
    NSMutableArray* results = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i=0; i<count; i++) {
        [results addObject:iterate([self objectAtIndex:i], i)];
    }
    return results;
}

- (void)parallel:(NSUInteger)parallel map:(HHAsyncIterate)iterate finish:(HHAsyncFinish)finish {
    __block NSUInteger waitingFor = [self count];
    __block NSMutableArray* results = [NSMutableArray arrayWithCapacity:waitingFor];
    __block NSUInteger nextIndex = 0;
    __block BOOL sawError = NO;
    if (parallel < waitingFor) { parallel = waitingFor; }
    
    __block HHAsyncYieldResult yield;
    
    void (^processNextItem)() = ^() {
        if (waitingFor == 0) {
            return finish(nil, results);
        }
        NSUInteger index = nextIndex;
        if (index == [self count]) {
            // no more processing to be done - just wait for the remaining parallel requests to finish
            return;
        }
        nextIndex += 1;
        iterate([self objectAtIndex:index], index, yield);
    };
    
    yield = ^(id error, id result) {
        if (sawError) { return; }
        if (error) {
            sawError = YES;
            finish(error, nil);
        } else {
            [results addObject:result];
            waitingFor -= 1;
            processNextItem();
        }
    };
    
    for (NSUInteger parallelI=0; parallelI < parallel; parallelI++) {
        processNextItem();
    }
}

@end
