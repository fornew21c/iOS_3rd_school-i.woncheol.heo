//
//  GameCharacter.m
//  0118Project
//
//  Created by Woncheol on 2017. 1. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "GameCharacter.h"

@interface GameCharacter ()

@property  (readwrite)NSString *name;
    @property NSUInteger attackPower;
    @property NSInteger hp;
    @property NSUInteger magicPower;
    @property NSUInteger mana;

@end

@implementation GameCharacter

- (GameCharacter*)initWithProperty:(NSString*)name
                      ap:(NSUInteger)ap
                      hp:(NSInteger)hp
                      mp:(NSUInteger)mp
                      mn:(NSUInteger)mn
{
    self.name = name;
    self.attackPower = ap;
    self.hp = hp;
    self.magicPower = mp;
    self.mana = mn;
    
    return self;
}
- (void)jumpTo:(GameCharacter *)character
{
    NSLog(@"%@에게로 점프합니다", character.name);
}

- (void) physicalAttack:(GameCharacter *)someCharacter myName:(NSString *)name
{
    NSLog(@"부모 physical Attack");
}

- (void) introduceMySelf
{
    NSLog(@"My name is %@.", self.name);
    NSLog(@"My attackpower is %lu.", self.attackPower);
    NSLog(@"My hp is %lu.", self.hp);
    NSLog(@"My magicalpower is %lu.", self.magicPower);
    NSLog(@"My mana is %lu.", self.mana);
}
@end
