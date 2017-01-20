//
//  main.m
//  Day3Project
//
//  Created by Woncheol on 2017. 1. 18..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    
    GameCharacter *gameCharter1 = [[Warrior alloc] initWithProperty:@"바바리안" ap:100 hp:200 mp:10 mn:10];
    Warrior *warrior1 = [[Warrior alloc] initWithProperty:@"바바리안" ap:100 hp:200 mp:10 mn:10];
 //   warrior1.name = @"바바리안";
 //   warrior1.attackPower = 50;
//    warrior1.hp = 100;
//    warrior1.magicPower = 10;
//    warrior1.mana = 10;
    [gameCharter1 introduceMySelf];
    NSLog(@"What is your name? %@", warrior1.name);
  //  NSLog(@"How many is your attackpower? %@", warrior1.attackPower);
    

    Wizard *wizard1 = [[Wizard alloc] init];
//    wizard1.name = @"해골마법사";
//    wizard1.attackPower = 70;
//    wizard1.hp = 150;
//    wizard1.magicPower = 80;
//    wizard1.mana = 100;
    
    [warrior1 physicalAttack:wizard1
              myName:wizard1.name];
  //  [warrior1 jumpTo:wizard1];
   // [wizard1 jumpTo:warrior1];
    
   // [wizard1 physicalAttack:warrior1];
    
 //  [warrior1 physicalAttack:wizard1];
  //  [warrior1 physicalAttack:wizard1];
    //NSNumber
    return 0;
}
