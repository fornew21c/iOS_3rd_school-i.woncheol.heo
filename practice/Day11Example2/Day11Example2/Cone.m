//
//  Cone.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Cone.h"

@interface Cone ()

@property CGFloat radian;
@property CGFloat height;

@end

@implementation Cone

- (CGFloat) getVolume
{
    return (CGFloat)1/3 * 3.14 * self.radian * self.radian * self.height;
}

@end
