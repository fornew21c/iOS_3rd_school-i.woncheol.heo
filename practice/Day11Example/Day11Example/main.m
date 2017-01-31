//
//  main.m
//  Day11Example
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        ClassCalculator *cc1 = [[ClassCalculator alloc] init];
//        cc1.korean = 95;
//        cc1.math = 97;
//        cc1.english = 93;
//        cc1.history = 50;
        
        ClassCalculator *cc2 = [[ClassCalculator alloc] initWithScores:95 math:86 english:97 history:55];
        
        NSLog(@"합계는 %lu입니다.", cc2.getSum);
        NSLog(@"평균은 %f입니다.", cc2.getAverage);
        
        
    }
    return 0;
}
