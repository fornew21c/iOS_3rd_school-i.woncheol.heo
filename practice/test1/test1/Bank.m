//
//  Bank.m
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Bank.h"
#import "Person.h"

@implementation Bank

- (void) changeAddress:(Bank *)bank changedLocation:(NSString*)location
{
    NSLog(@"%@은행이 %@에서 %@로 주소를 변경하였습니다.", bank.name, bank.location, location);
}

- (void) transfer:(Person *)person1 toPerson:(Person *)person2 trasferredAmmount:(NSUInteger)ammount
{
    NSLog(@"%@가 %@에게 %lu를 이체하였습니다.", person1.name, person2.name, ammount);
}
@end
