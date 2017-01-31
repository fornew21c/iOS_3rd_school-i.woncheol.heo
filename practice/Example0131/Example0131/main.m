//
//  main.m
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Developer.h"
#import "Designer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *person1 = [[Person alloc] initWithName:@"Tim"];
        person1.age = 30;
        person1.gender = @"man";
        person1.height =  180;
        person1.birthday = @"1990/01/31";
        
        [person1 settingJob:@"iOS Developer"];
        BOOL isBirthday;
        isBirthday = [person1 isTodayYourBitrhday];
        
        if(isBirthday)
        {
            NSLog(@"Today is your birthday. Congraturation!!!");
        }
        else
        {
            NSLog(@"Today is not your birthday");
        }
        NSLog(@"%@'s job is %@.", person1.name, person1.job);
        
        Developer *developer1 =  [[Developer alloc] initWithName:@"Tom"];
        [developer1 settingJob:@"Android Developer"];
        NSInteger lastDay = [person1 lastDayOfMonth:12];
        
        NSLog(@"12월의 마지막날은 %lu일입니다.", lastDay);
        
        
        //NSLog(@"Hello, World!");
    }
    return 0;
}
