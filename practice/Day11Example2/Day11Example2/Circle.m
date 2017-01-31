//
//  Circle.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Circle.h"

@interface Circle ()

@property CGFloat radian;
@property CGFloat pie;

@end

@implementation Circle

- (CGFloat) getArea
{
    CGFloat pie = 3.14;
    CGFloat area = pie * self.radian * self.radian;
    return area;
}

- (CGFloat) getCircumference
{
    CGFloat pie = 3.14;
    CGFloat circumference = 2 * pie * self.radian;
    return circumference;
}
@end
