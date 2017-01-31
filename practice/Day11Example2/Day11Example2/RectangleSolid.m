//
//  RectangleSolid.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "RectangleSolid.h"

@interface RectangleSolid ()

@property CGFloat width;
@property CGFloat length;
@property CGFloat height;

@end

@implementation RectangleSolid

- (CGFloat) getVolume
{
    return self.width * self.length * self.height;
}

@end
