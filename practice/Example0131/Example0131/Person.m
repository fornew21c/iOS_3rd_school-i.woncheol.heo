//
//  Person.m
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString*)myName
{
    self = [super init];
    if(self)
    {
        self.name = myName;
    }
    return self;
}

- (void)settingJob:(NSString*)myJob
{
    self.job = myJob;
}

- (BOOL)isTodayYourBitrhday
{
    NSString *today = @"2017/01/31";
    NSArray *temp = [today componentsSeparatedByString:@"/"];
    
//    NSUInteger year = [temp[0] integerValue];
    NSUInteger month = [temp[1] integerValue];
    NSUInteger day = [temp[2] integerValue];
    
    NSArray *myTemp = [self.birthday componentsSeparatedByString:@"/"];
    
//    NSUInteger myYear = [myTemp[0] integerValue];
    NSUInteger myMonth = [myTemp[1] integerValue];
    NSUInteger myDay = [myTemp[2] integerValue];
    
    if(month == myMonth && day == myDay)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (NSInteger)lastDayOfMonth:(NSInteger)thisMonth
{
    NSInteger lastDay = 0;
    
    switch(thisMonth)
    {
    case 1:
        lastDay = 31;
        break;
    case 2:
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
@end
