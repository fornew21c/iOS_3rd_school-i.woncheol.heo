//
//  CalssCalculator.h
//  Day11Example
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassCalculator : NSObject

- (instancetype) initWithScores:(NSUInteger)korean math:(NSUInteger)math english:(NSUInteger)english history:(NSUInteger)history;
- (NSUInteger) getSum;
- (CGFloat) getAverage;
@end
