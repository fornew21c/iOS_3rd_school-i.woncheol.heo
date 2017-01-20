//
//  Woman.m
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Woman.h"
#import "bank.h"

@implementation Woman

- (void) updateBankbook:(Woman *)woman bank:(Bank *)bank
{
    NSLog(@"%@가 %@은행에서 통장정리를 하였습니다.", woman.name, bank.name);
}
@end
