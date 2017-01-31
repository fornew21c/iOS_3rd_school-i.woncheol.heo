//
//  ToolBox.m
//  Day11Example4
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox

+ (CGFloat)inchToCm:(CGFloat)inch
{
    return inch*2.54;
}

+ (CGFloat)cmToInch:(CGFloat)cm
{
    return cm/2.54;
}

+ (CGFloat)m2ToPyung:(CGFloat)m2
{
    return m2 / 3.305785;
}

+ (CGFloat)pyungToM2:(CGFloat)pyung
{
    return pyung * 3.305785;
}

+ (CGFloat)cToF:(CGFloat)c
{
    return c * 33.8;
}

+ (CGFloat)fToC:(CGFloat)f
{
    return f / 33.8;
}
@end
