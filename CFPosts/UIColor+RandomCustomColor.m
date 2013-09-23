//
//  UIColor+RandomCustomColor.m
//  CFPosts
//
//  Created by Brad on 9/11/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "UIColor+RandomCustomColor.h"

@implementation UIColor (RandomCustomColor)

+ (UIColor *)randomColor
{
    CGFloat red = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat blue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat green = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
  
}

- (UIColor *)lightenColor:(UIColor *)color
{
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:1 alpha:alpha];
    
    
    
}



@end
