//
//  ToolBox.m
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox

+ (BOOL)isDeveloper:(Person*)person
{
    if([person.job isEqualToString:@"developer"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isDesigner:(Person*)person
{
    if([person.job isEqualToString:@"designer"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString*)getOlderBroter:(Person*)person1 person2:(Person*)person2
{
    if(person1.age > person2.age) {
        return person1.name;
    }
    else if(person1.age < person2.age) {
        return person2.name;
    }
    else {
        return @"동갑";
    }
}

- (NSUInteger)absoluteNum:(NSInteger)num
{
    if(num >= 0) {
        return num;
    }
    else {
        return -num;
    }
}

- (NSUInteger)calcuOP:(NSString*)op num1:(NSUInteger)num1 num2:(NSUInteger)num2
{
    if([op isEqualToString:@"+"])
    {
        return num1+num2;
    }
    else if([op isEqualToString:@"-"])
    {
//  첫번째 방법
/*        
        NSInteger tmpNum = num1 - num2;
        if(tmpNum >= 0)
            return tmpNum;
        else
            return -tmpNum;
*/
// 두번째 방법
        
        if(num2 > num1) {
            NSLog(@"before swap --- num1:%lu num2:%lu", num1, num2);
            //[self swap:&num1 num2:&num2];
            NSUInteger temp = 0;
            temp = num1;
            num1 = num2;
            num2 = temp;
            NSLog(@"after swap --- num1:%lu num2:%lu", num1, num2);
        }
        
        return num1 - num2;
    }
    else{
        return 0;
    }
}

- (void)swap:(NSUInteger*)num1 num2:(NSUInteger*)num2
{
    NSUInteger temp;
    temp = *num1;
    *num1 =  *num2;
    *num2 =  temp;
    
}

- (CGFloat)roundNum:(CGFloat)num
{
    //CGFloat returnVal = roundf(num * 100) / 100;
    //return returnVal;

    CGFloat overNum = num + 0.005;
    NSInteger cutNum = (NSInteger)(overNum * 100);
    CGFloat roundNum = ((CGFloat) cutNum) / 100;
    return roundNum;
    
}

- (BOOL)checkLeapYear:(NSUInteger)year
{
    if(year % 4 == 0) {
        if(year % 100 == 0) {
            if(year % 400 == 0){
                return YES;
            }
            return NO;
        }
        return YES;
    }
    else {
        return NO;
    }
}

- (NSUInteger)lastDayOfMonth:(NSUInteger)thisMonth year:(NSUInteger)thisYear
{
    NSUInteger lastDay = 0;
    BOOL leapYearYn = [self checkLeapYear:thisYear];
    
    switch(thisMonth)
    {
        case 1:
            lastDay = 31;
            break;
        case 2:
            if(leapYearYn == YES)
                lastDay = 29;
            else
                lastDay = 28;
            break;
        case 3:
            lastDay = 31;
            break;
        case 4:
            lastDay = 30;
            break;
        case 5:
            lastDay = 31;
            break;
        case 6:
            lastDay = 30;
            break;
        case 7:
            lastDay = 31;
            break;
        case 8:
            lastDay = 31;
            break;
        case 9:
            lastDay = 30;
            break;
        case 10:
            lastDay = 31;
            break;
        case 11:
            lastDay = 30;
            break;
        case 12:
            lastDay = 31;
            break;
    }
    return lastDay;
    

}

- (void)multiplicationTable:(NSUInteger)dan
{
    NSInteger cnt = 1;
    while(cnt < 10) {
        NSLog(@"%lu * %lu = %lu", dan, cnt, dan * cnt);
        cnt++;
    }
}
@end
