//
//  NSArray+OCArray.h
//  dogo
//
//  Created by Marcus Westin on 1/27/13.
//  Copyright (c) 2013 Flutterby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HHMakeStructs)

// Make more advanced structures from arrays
- (CGSize)makeSize;
- (CGRect)makeRect;
- (CGPoint)makePoint;
- (UIColor*)makeRgbColor;
- (UIColor*)makeRgbaColor;

@end

@interface NSString (HHMakeStructs)

- (CGRect)makeRect;
- (CGSize)makeSize;
- (CGPoint)makePoint;
- (UIColor*)makeRgbColor;
- (UIColor*)makeRgbaColor;

@end
