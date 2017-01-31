//
//  Figure.h
//  Day11Example3
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Figure : NSObject

- (NSString*)getFigureName;
- (void)setFigureName:(NSString*)figureName;
- (CGFloat)getWidth;
- (void) settingWidth:(CGFloat)width;

@end
