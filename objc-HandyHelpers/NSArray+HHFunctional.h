//
//  Created by Marcus Westin on 1/27/13.
//  Copyright (c) 2013 Flutterby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^HHSyncIterate)(id object, NSUInteger index);
typedef void (^HHAsyncYieldResult)(id err, id result);
typedef void (^HHAsyncIterate)(id object, NSUInteger index, HHAsyncYieldResult next);
typedef void (^HHAsyncFinish)(id err, NSMutableArray* results);

@interface NSArray (HHFunctional)

- (NSMutableArray*) map:(HHSyncIterate)iterate;
- (void)parallel:(NSUInteger)parallel map:(HHAsyncIterate)iterate finish:(HHAsyncFinish)finish;

@end
