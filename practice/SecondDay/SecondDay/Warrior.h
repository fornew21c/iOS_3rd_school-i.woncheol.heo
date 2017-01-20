//
//  Warrior.h
//  SecondDay
//
//  Created by Woncheol on 2017. 1. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Wizard;

@interface Warrior : NSObject

@property NSString *name;
@property NSUInteger health;
@property NSUInteger mana;
@property NSUInteger physicalPower;
@property NSUInteger magicalPower;
@property BOOL isDead;

- (id) physicalAttack:(Wizard *)someCharacter;
- (id) magicalAttack:(Wizard  *)someCharacter;
//- (id) jump:(id)somewhere;

@end
