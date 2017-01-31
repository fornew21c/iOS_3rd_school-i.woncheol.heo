//
//  Triangle.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Triangle.h"

@interface Triangle()

@property CGFloat bottom;
@property CGFloat height;

@end

@implementation Triangle

- (CGFloat) getArea
{
    return 0.5 * self.bottom * self.height;
}
@end
