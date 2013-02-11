//
//  NSString+HHUriEncoding.h
//  dogo
//
//  Created by Marcus Westin on 1/28/13.
//  Copyright (c) 2013 Flutterby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HHUriEncoding)
- (NSString*)encodeURIComponent;
- (NSString*)decodeURIComponent;
- (NSMutableDictionary*)parseQueryParams;
@end
