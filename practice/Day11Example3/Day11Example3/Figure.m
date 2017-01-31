//
//  Figure.m
//  Day11Example3
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Figure.h"

@interface Figure ()

@property NSString *figureName;

//-(void)setWidth:(CGFloat)width
//-(CGFloat)width;
//CGFloat _width;
@property CGFloat width;
@property CGFloat length;
@property CGFloat radian;
@property CGFloat height;
@property CGFloat bottomWidth;
@property CGFloat topWidth;

@end

@implementation Figure

- (NSString*)getFigureName
{
    return self.figureName;
}

//- (void)setFigureName:(NSString*)figureName;
//{
//    self.figureName = figureName;
//}

- (CGFloat)getWidth
{
    //self.width = 10
    //>> [self setWidth:10];
    
    //self.width
    //[self width];
    return self.width;
}

- (void) settingWidth:(CGFloat)width
{
    self.width = width;
    //return 5.0;
}
@end
