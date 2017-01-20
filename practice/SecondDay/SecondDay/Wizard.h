//
//  Wizard.h
//  SecondDay
//
//  Created by Woncheol on 2017. 1. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Warrior;

@interface Wizard : NSObject

@property NSString *name;
@property NSUInteger health;
@property NSUInteger mana;
@property NSUInteger physicalPower;
@property NSUInteger magicalPower;
@property BOOL isDead;

- (id) physicalAttack:(Warrior *)someCharacter;
- (id) magicalAttack:(Warrior  *)someCharacter;
//- (id) jump:(id)somewhere;

@end
