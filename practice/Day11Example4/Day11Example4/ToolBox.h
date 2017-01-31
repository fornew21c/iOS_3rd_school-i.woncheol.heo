//
//  ToolBox.h
//  Day11Example4
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBox : NSObject

+ (CGFloat)inchToCm:(CGFloat)inch;
+ (CGFloat)cmToInch:(CGFloat)cm;
+ (CGFloat)m2ToPyung:(CGFloat)m2;
+ (CGFloat)pyungToM2:(CGFloat)pyung;
+ (CGFloat)cToF:(CGFloat)c;
+ (CGFloat)fToC:(CGFloat)f;

@end
