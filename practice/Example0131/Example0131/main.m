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
#import "ToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *person1 = [[Person alloc] initWithName:@"Tim"];
        person1.age = 30;
        person1.gender = @"man";
        person1.height =  180;
        person1.birthday = @"1988/01/31";
        [person1 settingJob:@"developer"];
        
        Person *person2 = [[Person alloc] initWithName:@"Harry"];
        person2.age = 30;
        person2.gender = @"man";
        person2.height =  178;
        person2.birthday = @"1986/07/31";
        [person2 settingJob:@"designer"];
        
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
        
        if([ToolBox isDeveloper:person1])
        {
            NSLog(@"%@'s job is a developer.", person1.name);
        }
        else
        {
            NSLog(@"%@'s job is not a developer.", person1.name);
        }
        
        if([[ToolBox getOlderBroter:person1 person2:person2] isEqualToString:@"동갑"]) {
            NSLog(@"%@와 %@는 동갑입니다.", person1.name, person2.name);
        }
        else {
            NSLog(@"%@와 %@중 형은 %@입니다.", person1.name, person2.name, [ToolBox getOlderBroter:person1 person2:person2]);
        }
        //NSLog(@"Hello, World!");
        
        ToolBox *toolbox = [[ToolBox alloc] init];
        NSLog(@"결과값:%lu", [toolbox absoluteNum:124]);
        NSLog(@"결과값:%lu", [toolbox absoluteNum:-124]);
        
        NSLog(@"결과값:%lu",[toolbox calcuOP:@"+" num1:10 num2:3]);
        NSLog(@"결과값:%lu",[toolbox calcuOP:@"-" num1:10 num2:3]);
        NSLog(@"결과값:%lu",[toolbox calcuOP:@"-" num1:4 num2:10]);
        
        NSLog(@"결과값:%lf",[toolbox roundNum:3.134]);
        NSLog(@"결과값:%lf",[toolbox roundNum:3.4552]);
        
        if([toolbox checkLeapYear:1995]){
            NSLog(@"YES");
        }
        else
        {
            NSLog(@"NO");
        }

        if([toolbox checkLeapYear:2000]){
            NSLog(@"YES");
        }
        else
        {
            NSLog(@"NO");
        }
        
        NSLog(@"결과값:%lu", [toolbox lastDayOfMonth:2 year:2000]);
        NSLog(@"결과값:%lu", [toolbox lastDayOfMonth:2 year:1999]);
        
        [toolbox multiplicationTable:3];
    }
    return 0;
}
