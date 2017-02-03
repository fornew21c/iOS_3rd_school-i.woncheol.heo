//
//  Person.h
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSUInteger age;
@property NSString *nationality;
@property NSString *gender;
@property NSUInteger height;
@property NSString *job;
@property NSString *birthday;

- (instancetype)initWithName:(NSString*)myName;
- (void)settingJob:(NSString*)myJob;
- (BOOL)isTodayYourBitrhday;
- (NSInteger)lastDayOfMonth:(NSInteger)thisMonth;


@end
