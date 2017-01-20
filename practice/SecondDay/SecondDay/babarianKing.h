//
//  babarianKing.h
//  SecondDay
//
//  Created by Woncheol on 2017. 1. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface babarianKing : NSObject

@property id level;
@property id energy;
@property id abilityLevel;
@property id regenerationTime;
@property id upgradeTime;
@property id upgradeDarkElisor;
@property id damagePerSecond;
@property id favoriteTarget;
@property id damageType;
@property id targets;
@property id moveSpeed;

- (id)attack;
- (id)regenerate;
- (id)upgrade;
- (id)sleep;

@end
