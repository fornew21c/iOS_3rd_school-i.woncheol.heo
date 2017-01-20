//
//  main.m
//  test1
//
//  Created by Woncheol on 2017. 1. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Bank.h"
#import "Man.h"
#import "Woman.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
    }
    Man *man1 = [[Man alloc] init];
    man1.name = @"Tim";
    man1.ammount = 100000000;
    
    Woman *woman1 = [[Woman alloc] init];
    woman1.name = @"Jihyun";
    woman1.ammount = 6500000000;
    
    Bank *bank1 = [[Bank alloc] init];
    bank1.name = @"citi";
    bank1.location = @"seoul";
    
    [man1 withdraw:man1 bank:bank1 sendedAmmount:700];
    [woman1 withdraw:woman1 bank:bank1 sendedAmmount:500];
    
    [man1 inquireAmount:man1 bank:bank1];
    [woman1 inquireAmount:woman1 bank:bank1];
    
    [bank1 changeAddress:bank1 changedLocation:@"제주도"];
    
    [bank1 transfer:man1 toPerson:woman1 trasferredAmmount:1000];
    return 0;
}
