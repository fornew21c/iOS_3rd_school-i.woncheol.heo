//
//  Man.m
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Man.h"
#import "bank.h"

@implementation Man

- (void) withdraw:(Person *)man bank:(Bank *)bank sendedAmmount:(NSUInteger)ammount
{
    [super withdraw:man bank:bank sendedAmmount:ammount];
    [self inquireAmount:man bank:bank];

}
- (void) createCard:(Man *)man bank:(Bank *)bank
{
    NSLog(@"%@가 %@은행에서 카드를 만들었습니다.", man.name, bank.name);
}
@end
