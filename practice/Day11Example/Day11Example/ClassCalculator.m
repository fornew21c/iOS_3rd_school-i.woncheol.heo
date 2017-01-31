//
//  CalssCalculator.m
//  Day11Example
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ClassCalculator.h"

@interface ClassCalculator ()

@property NSUInteger korean;
@property NSUInteger math;
@property NSUInteger english;
@property NSUInteger history;

@end

@implementation ClassCalculator


- (instancetype) initWithScores:(NSUInteger)korean
                           math:(NSUInteger)math
                        english:(NSUInteger)english
                        history:(NSUInteger)history
{
    self = [super init];
    
    self.korean = korean;
    self.math = math;
    self.english = english;
    self.history = history;
    
    return self;
}

- (NSUInteger) getSum
{
    NSUInteger sum;
    sum = self.korean + self.math + self.english + self.history;
    return sum;
}

- (CGFloat) getAverage
{
    
    CGFloat average = (CGFloat)[self getSum] / 4.0;
    return average;
}
@end
