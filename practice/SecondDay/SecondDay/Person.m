//
//  Person.m
//  SecondDay
//
//  Created by Woncheol on 2017. 1. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Person.h"

@implementation Person


/**
  * 퀵서치 테스트
 */

- (id)think
{
    NSLog(@"%@ is thinking", self.name);
    return nil;
}

- (id)dream
{
    NSLog(@"%@ is thinking", self.name);
    return nil;
}

- (id)run
{
    NSLog(@"%@ is running", self.name);
    return nil;
}

- (id)eat
{
    NSLog(@"%@ is eating", self.name);
    return nil;
}

- (id)work
{
    NSLog(@"%@ is working", self.name);
    return nil;
}

- (id)exercise
{
    NSLog(@"%@ is exercising", self.name);
    return nil;
}

- (id)buy
{
    NSLog(@"%@ is buying", self.name);
    return nil;
}

- (id)sell
{
    NSLog(@"%@ is selling", self.name);
    return nil;
}

- (id)sleep
{
    NSLog(@"sleeping");
    NSLog(@"%@ is sleeping", self.name);
    return nil;
}

@end
