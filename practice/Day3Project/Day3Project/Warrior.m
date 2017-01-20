//
//  Warrior.m
//  Day3Project
//
//  Created by Woncheol on 2017. 1. 18..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"

@implementation Warrior

- (void) physicalAttack:(Wizard *)someCharacter myName:(NSString *)name
{
  //  NSLog(@"%@ is attacking %@ by %lu attackPower.", self.name, name, self.attackPower);
 //   NSInteger someCharacterHp = someCharacter.hp - self.attackPower;
    
    
   // if(someCharacterHp <= 0) {
  //      NSLog(@"%@ is dead", someCharacter.name);
   //     return;
   // }
    
   // NSLog(@"%@'s hp is reduced from %lu to %lu", someCharacter.name, someCharacter.hp, someCharacterHp);
  //  someCharacter.hp = someCharacterHp;
   // NSLog(@"%@'s hp is %lu now.\n", someCharacter.name, someCharacter.hp);
}

- (void)jumpTo:(GameCharacter *)character
{
    NSLog(@"Warrior is jumping to wizard");
   // [super jumpTo:character];
   // [self physicalAttack:character myName:character.name];
}
@end
