//
//  Bank.h
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Bank : NSObject

@property NSString* name;
@property NSString* location;

- (void) changeAddress:(Bank *)bank changedLocation:(NSString *)name;
- (void) transfer:(Person *)man toPerson:(Person *)woman trasferredAmmount:(NSUInteger)ammount;

@end
