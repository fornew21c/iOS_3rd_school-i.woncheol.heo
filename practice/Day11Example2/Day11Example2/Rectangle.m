//
//  Rectangle.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Rectangle.h"
@interface Rectangle ()

@property CGFloat length;
@property CGFloat width;

@end

@implementation Rectangle

//- (void) settingWidth:(CGFloat)width
//{
//    self.width = width;
//}

- (CGFloat) getWidth
{
    return self.width;
}

//- (void) settingLength:(CGFloat)length
//{
//    self.length = length;
//}

- (CGFloat) getLength
{
    return self.width;
}

- (CGFloat) getArea
{
    return self.width * self.length;
}

- (CGFloat) getPerimeter
{
    return 2 * self.width + 2 * self.length;
}
@end
