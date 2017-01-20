//
//  main.m
//  InheritanceSample
//
//  Created by Woncheol on 2017. 1. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *student1 = [[Student alloc] init];
        student1.name = @"James";
        student1.age = 30;
        [student1 eat:student1.name];
    }
    

    return 0;
}
