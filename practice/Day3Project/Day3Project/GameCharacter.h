//
//  GameCharacter.h
//  0118Project
//
//  Created by Woncheol on 2017. 1. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject
@property (readonly) NSString *name;

- (void) physicalAttack:(GameCharacter *)someCharacter myName:(NSString*)name;
//- (void) magicalAttack:(Wizard *)someCharacter;
- (void) jumpTo:(GameCharacter *)character;
- (GameCharacter*)initWithProperty:(NSString*)name
                      ap:(NSUInteger)ap
                      hp:(NSInteger)hp
                      mp:(NSUInteger)mp
                      mn:(NSUInteger)mn;
- (void) introduceMySelf;
@end
