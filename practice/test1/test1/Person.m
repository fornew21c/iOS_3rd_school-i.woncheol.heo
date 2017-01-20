//
//  Person.m
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@implementation Person

- (void) withdraw:(Person *)person bank:(Bank *)bank sendedAmmount:(NSUInteger)ammount
{
    NSLog(@"%@가 %@은행에 %lu를 입금하였습니다.", person.name, bank.name, ammount);
}

- (void) inquireAmount:(Person *)person bank:(Bank *)bank
{
    NSLog(@"%@가 %@은행에서 자신의 계좌를 조회해 본 결과, 총 자산은 %lu입니다.", person.name, bank.name, person.ammount);
}
@end
