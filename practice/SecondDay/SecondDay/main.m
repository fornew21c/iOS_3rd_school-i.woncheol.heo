//
//  main.m
//  SecondDay
//
//  Created by Woncheol on 2017. 1. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }

    Person *me = [[Person alloc] init];
    me.name = @"전지현";
    me.age = @36;
    me.gender = @"여성";
    me.mobileNumber = @"010-3435-9538";
    
//    [me eat];
 //   [me run];
//    [me exercise];
    
    Person *you = [[Person alloc] init];
    you.name = @"허준재";
    you.age = @30;
    you.gender = @"남성";
    you.mobileNumber = @"010-3565-2343";
 //   int age_gap = 6;
    
 //   [you eat];
  //  [you run];
 //   [you exercise];
    
    Warrior *babarian = [[Warrior alloc] init];
    babarian.name = @"바바리안";
    babarian.health = 500;
    babarian.mana = 200;
    babarian.physicalPower = 170;
    babarian.magicalPower = 180;
    
 //   [babarian magicalAttack];
    
    Warrior *archer = [[Warrior alloc] init];
    archer.name = @"아처";
    archer.health = 50;
    archer.mana = 250;
    archer.physicalPower = 120;
    archer.magicalPower = 150;
    
    
    Wizard *womenWizard = [[Wizard alloc] init];
    womenWizard.name = @"여마법사";
    womenWizard.health = 200;
    womenWizard.physicalPower = 200;
    womenWizard.magicalPower = 300;
    
  //  [women_wizard physicalAttack];
  //  [women_wizard magicalAttack];
    
    Wizard *hitempler = [[Wizard alloc] init];
    hitempler.health = 80;
    hitempler.physicalPower = 300;
    hitempler.magicalPower =  400;
    
 //   [hitempler physicalAttack];
 //   [hitempler magicalAttack];
    
  /*
    NSLog(@"My name is %@", me.name);
    NSLog(@"%@ : %@", me.name, me.mobileNumber);
    NSLog(@"%@ : %@", you.name, you.mobileNumber);
    
    NSLog(@"babarian's health: %lu", babarian.health);
    NSLog(@"hitempler's magicalPower: %lu", hitempler.magicalPower);
    
    NSLog(@"바바리안의 체력은 %lu이고, 아처의 체력은 %lu입니다.", babarian.health, archer.health);
    NSLog(@"%@와 %@는 사랑하는 사이입니다.", me.name, you.name);
//    NSLog(@"%@와 %@의 나이 차이는 %@입니다.", me.name, you.name, age_gap);
    NSLog(@"아처의 공격력은 %lu니다.", archer.mana);
    */
    
   [babarian physicalAttack:womenWizard];
    [womenWizard physicalAttack:babarian];

    return 0;
}
