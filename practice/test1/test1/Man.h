//
//  Man.h
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Man : Person

- (void) withdraw:(Person *)person bank:(Bank *)bank sendedAmmount:(NSUInteger)ammount;
- (void) createCard:(Man *)man bank:(Bank *)bank;

@end
