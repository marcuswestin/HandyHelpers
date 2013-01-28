//
//  NSArray+OCArray.m
//  dogo
//
//  Created by Marcus Westin on 1/27/13.
//  Copyright (c) 2013 Flutterby. All rights reserved.
//

#import "NSArray+NSString+HHMakeStructs.h"

@implementation NSArray (HHMakeStructs)

- (CGSize)makeSize {
    return CGSizeMake([self _floatAt:0], [self _floatAt:1]);
}

- (CGRect)makeRect {
    return CGRectMake([self _floatAt:0], [self _floatAt:1], [self _floatAt:2], [self _floatAt:3]);
}

- (CGPoint)makePoint {
    return CGPointMake([self _floatAt:0], [self _floatAt:1]);
}

- (UIColor *)makeRgbColor {
    return [UIColor colorWithRed:[self _colorAt:0] green:[self _colorAt:1] blue:[self _colorAt:2] alpha:1.0];
}

- (UIColor *)makeRgbaColor {
    return [UIColor colorWithRed:[self _colorAt:0] green:[self _colorAt:1] blue:[self _colorAt:2] alpha:[self _floatAt:3]];
}

// Utils

- (float)_colorAt:(NSUInteger)index { return [[self objectAtIndex:index] intValue] / 255.0; }

- (float)_floatAt:(NSUInteger)index {
    return [[self objectAtIndex:index] floatValue];
}

@end

@implementation NSString (HHMakeStructs)

// x.y.w.h -> CGRect
- (CGRect)makeRect {
    return [[self _dotSeperated] makeRect];
}
// w.h -> CGSize
- (CGSize)makeSize {
    return [[self _dotSeperated] makeSize];
}
// x.y -> CGPoint
- (CGPoint)makePoint {
    return [[self _dotSeperated] makePoint];
}
// r.g.b -> UIColor
- (UIColor*)makeRgbColor {
    return [[self _dotSeperated] makeRgbColor];
}
// r.g.b.a -> UIColor
- (UIColor*)makeRgbaColor {
    return [[self _dotSeperated] makeRgbaColor];
}

- (NSArray*) _dotSeperated {
    return [self componentsSeparatedByString:@"."];
}

@end
