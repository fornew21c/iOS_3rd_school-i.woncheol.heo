//
//  CircularCylinder.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "CircularCylinder.h"

@interface CircularCylinder ()

@property CGFloat radian;
@property CGFloat height;

@end

@implementation CircularCylinder

- (CGFloat) getVolume
{
    return 3.14 * self.radian * self.height;
}

@end
