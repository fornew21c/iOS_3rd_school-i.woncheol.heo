//
//  ToolBox.h
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface ToolBox : NSObject

+ (BOOL)isDeveloper:(Person*)person;
+ (BOOL)isDesigner:(Person*)person;
+ (NSString*)getOlderBroter:(Person*)person1 person2:(Person*)person2;

- (NSUInteger)absoluteNum:(NSInteger)num;
- (NSUInteger)calcuOP:(NSString*)op num1:(NSUInteger)num1 num2:(NSUInteger)num2;
- (void)swap:(NSUInteger*)num1 num2:(NSUInteger*)num2;
- (CGFloat)roundNum:(CGFloat)num;
- (BOOL)checkLeapYear:(NSUInteger)year;
- (NSUInteger)lastDayOfMonth:(NSUInteger)month year:(NSUInteger)year;
- (void)multiplicationTable:(NSUInteger)dan;

@end
