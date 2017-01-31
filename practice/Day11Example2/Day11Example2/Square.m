//
//  Square.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Square.h"

@interface Square ()

@property CGFloat width; // 길이

@end

@implementation Square

//- (void) settingWidth:(CGFloat)width
//{
//    self.width = width;
//}

- (CGFloat) getWidth
{
    return self.width;
}

// 넓이를 구하는 메소드
- (CGFloat) getArea
{
    return self.width * self.width;
}

- (CGFloat) getPerimeter
{
    return 4 * self.width;
}
@end
