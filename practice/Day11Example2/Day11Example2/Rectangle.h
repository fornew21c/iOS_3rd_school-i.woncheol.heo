//
//  Rectangle.h
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject

- (void) setWidth:(CGFloat)width;
- (CGFloat) getWidth;
- (void) setLength:(CGFloat)length;
- (CGFloat) getLength;
- (CGFloat) getArea;
- (CGFloat) getPerimeter;

@end
