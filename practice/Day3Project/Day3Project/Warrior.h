//
//  Warrior.h
//  Day3Project
//
//  Created by Woncheol on 2017. 1. 18..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCharacter.h"
@class Wizard;

@interface Warrior : GameCharacter

- (void)jumpTo:(GameCharacter *)character;
@end
