//
//  Warrior.m
//  SecondDay
//
//  Created by Woncheol on 2017. 1. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"

@implementation Warrior

- (id) physicalAttack: (Wizard *)someCharacter
{
    NSLog(@"%@가 %lu의 물리공격력으로 %@을 공격중입니다", self.name, self.physicalPower, someCharacter.name);
    NSLog(@"%@의 에너지가 %lu에서 %lu으로 변하였습니다.", someCharacter.name, someCharacter.health , someCharacter.health - self.physicalPower);
    
    return nil;
}

- (id) magicalAttack: (Wizard *)someCharacter
{
    NSLog(@"전사가 %lu의 마법공격력으로 마법공격 중입니다", self.magicalPower);
    return nil;
}

@end
