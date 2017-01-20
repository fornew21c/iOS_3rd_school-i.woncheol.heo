//
//  Person.h
//  InheritanceSample
//
//  Created by Woncheol on 2017. 1. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString* name;
@property NSUInteger age;

- (void)eat:(NSString *)name;

@end
