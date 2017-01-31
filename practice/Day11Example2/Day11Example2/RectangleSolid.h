//
//  RectangleSolid.h
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RectangleSolid : NSObject

- (void) setWidth:(CGFloat)width;
- (void) setLength:(CGFloat)length;
- (void) setHeight:(CGFloat)height;
- (CGFloat) getVolume;

@end
