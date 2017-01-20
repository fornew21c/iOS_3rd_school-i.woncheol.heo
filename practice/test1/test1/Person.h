//
//  Person.h
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Bank;

@interface Person : NSObject

@property NSString* name;
@property NSUInteger ammount;

- (void) withdraw:(Person *)person bank:(Bank *)bank sendedAmmount:(NSUInteger)ammount;
- (void) inquireAmount:(Person *)person bank:(Bank *)bank;

@end
