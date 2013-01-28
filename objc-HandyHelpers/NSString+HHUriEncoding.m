//
//  NSString+HHUriEncoding.m
//  dogo
//
//  Created by Marcus Westin on 1/28/13.
//  Copyright (c) 2013 Flutterby. All rights reserved.
//

#import "NSString+HHUriEncoding.h"
#import "NSArray+HHFunctional.h"

@implementation NSString (HHUriEncoding)

- (NSMutableDictionary *)parseQueryParams {
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    for(NSString *keyValuePairString in [self componentsSeparatedByString:@"&"]) {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
        if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
        NSString *key = [[keyValuePairArray objectAtIndex:0] decodeURIComponent];
        NSString* rawValue = [keyValuePairArray objectAtIndex:1];
        id value;
        if ([rawValue rangeOfString:@","].location == NSNotFound) {
            value = [rawValue decodeURIComponent];
        } else {
            value = [[rawValue componentsSeparatedByString:@","] map:^id(NSString* part, NSUInteger index) {
                return [part decodeURIComponent];
            }];
        }
        [queryComponents setObject:value forKey:key];
    }
    return queryComponents;
}
- (NSString *)decodeURIComponent {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    return [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
- (NSString *)encodeURIComponent {
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    return [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
