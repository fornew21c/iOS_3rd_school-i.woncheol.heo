//
//  ToolBox.m
//  Example0201
//
//  Created by Woncheol on 2017. 2. 1..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox

- (void)multiplicationTable:(NSUInteger)dan
{
//    NSInteger cnt = 1;
//    while(cnt < 10) {
//        NSLog(@"%lu * %lu = %lu", dan, cnt, dan * cnt);
//        cnt++;
//    }
    
    NSInteger i;
    for(i = 1; i < 10; i++) {
        NSLog(@"%lu * %lu =  %lu", dan, i, dan * i);
    }
}

- (void)multiplicationTable2:(NSUInteger)dan
{
    NSInteger i;
    for(i = 1; i < 10; i++) {
        NSLog(@"%lu * %lu =  %lu", dan, i, dan * i);
    }
}

- (NSString*)findMultipleNum:(NSUInteger)num maxRange:(NSUInteger)maxRange
{
    NSUInteger i = 1;
    NSUInteger multiple = 0;
    NSString *resultStr = @"";
    
    while(YES){
        multiple = num * i;
        i++;
        if(multiple <= maxRange) {
            NSString *findNumStr = [NSString stringWithFormat:@"%lu ", multiple];
            resultStr = [resultStr stringByAppendingString:findNumStr];
        }
        else
            break;
    }
    return resultStr;
}

- (NSString*)findMultipleNum2:(NSUInteger)num maxRange:(NSUInteger)maxRange
{
    NSUInteger i;
    NSString *resultStr = @"";
    
    for(i = 1; i <= maxRange; i++)
    {
        if(i % num == 0) {
            NSString *findNumStr = [NSString stringWithFormat:@"%lu |", i];
            resultStr = [resultStr stringByAppendingString:findNumStr];
        }
    }
    return resultStr;
    
}
- (void)addAllNum:(NSUInteger)num
{
//문자열 사용
//    NSString *formmatterStr = [NSString stringWithFormat:@"%lu", num];
//    
//    NSUInteger length = [formmatterStr length];
//    NSUInteger i = 0;
//    NSUInteger cutNum = 0;
//    NSUInteger sum = 0;
//    
//    while(i < length)
//    {
//        cutNum = [[formmatterStr substringWithRange:NSMakeRange(i, 1)] integerValue];
//        sum = sum + cutNum;
//        i++;
//        
//    }
//    NSLog(@"SUM: %lu", sum);
    
    NSUInteger quotient = 0;
    NSUInteger reminder;
    NSUInteger sum = 0;
    
    while(num >= 1)
    {
 
        quotient = num / 10;
        reminder = num % 10;
        num = num / 10;
        //NSLog(@"reminder:%lu", reminder);
        sum += reminder;

    }
    NSLog(@"SUM: %lu", sum);
}

- (void)findStar:(NSString*)str
{
    //str substringWithRange:NSMakeRange(
                                       
}

- (NSUInteger)factorial:(NSUInteger)num
{
    NSUInteger i;
    NSUInteger factorial = 1;
    
    for(i = 1; i <= num; i++){
        factorial = factorial * i;
    }
    return factorial;
}

- (void)game369:(NSUInteger)max
{
    NSUInteger i;
    NSString *resultStr = @"";
    
    for(i = 1; i <= max; i++) {
        if(i % 10 == 3 || i % 10 == 6 || i % 10 == 9) {
            //NSLog(@"* |");
            NSString *findNumStr = [NSString stringWithFormat:@"* |"];
            resultStr = [resultStr stringByAppendingString:findNumStr];
        }
        else {
            NSString *findNumStr = [NSString stringWithFormat:@"%lu |", i];
            resultStr = [resultStr stringByAppendingString:findNumStr];
        }
    }
    NSLog(@"%@", resultStr);
}

- (void)printMultipleNumbers
{
    NSUInteger i, j;
    NSString *resultStr = @"\n";

    
    for(i = 1; i <= 9; i++) {
        for(j = 1; j <= 9; j++) {
            NSString *findNumStr = [NSString stringWithFormat:@"%lu * %lu = %lu |", j ,i, j*i];
            resultStr = [resultStr stringByAppendingString:findNumStr];
        }
        resultStr = [resultStr stringByAppendingString:@"\n"];

       
    }
     NSLog(@"%@", resultStr);
}

- (void)printStar:(NSUInteger)num
{
    //NSLog사용
    NSUInteger i, j;
    NSString *stars = @"";

    NSLog(@"NSLog사용.....");
    for(i = 1; i <=num; i++) {
        for(j = 1; j <= i; j++) {
            stars = [stars stringByAppendingString:@"*"];
        }
        NSLog(@"%@", stars);
        stars = @"";
    }
    
    
    //printf사용
//    NSLog(@"printf사용.....");
//    for(i = 1; i <=num; i++) {
//        for(j = 1; j <= i; j++) {
//            printf("*");
//        }
//        printf("\n");
//
//    }
}

- (void)printReverseStar:(NSUInteger)num
{
    //NSLog사용
    NSUInteger i, j;
    NSString *stars = @"";
    
    for(i = num; i >= 1; i--) {
        for(j = i; j >= 1; j--) {
            stars = [stars stringByAppendingString:@"*"];
        }
        NSLog(@"%@", stars);
        stars = @"";
        //stars = [stars stringByAppendingString:@"\n"];
    }
    
    
    //printf사용
//    NSUInteger i, j;
//    for(i = num; i >= 1; i--) {
//        for(j = i; j >= 1; j--) {
//            printf("*");
//        }
//        printf("\n");
//    }
}
@end
