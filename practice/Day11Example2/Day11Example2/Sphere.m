//
//  Sphere.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Sphere.h"

@interface Sphere ()

@property CGFloat radian;

@end

@implementation Sphere

- (CGFloat) getVolume
{
    return 4/3 * 3.14 * self.radian * self.radian * self.radian;
}

@end
