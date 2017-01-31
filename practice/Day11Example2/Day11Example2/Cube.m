//
//  Cube.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Cube.h"
@interface Cube ()

@property CGFloat width;

@end

@implementation Cube

- (CGFloat) getVolume
{
    return self.width * self.width * self.width;
}
@end
