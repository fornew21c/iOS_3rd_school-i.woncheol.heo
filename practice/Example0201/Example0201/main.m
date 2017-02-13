//
//  main.m
//  Example0201
//
//  Created by Woncheol on 2017. 2. 1..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        ToolBox *toolbox = [[ToolBox alloc] init];
        //[toolbox multiplicationTable:3];
//        [toolbox multiplicationTable2:7];
//        NSLog(@"%@", [toolbox findMultipleNum:3 maxRange:10]);
//        NSLog(@"%@", [toolbox findMultipleNum:5 maxRange:10]);
//        
//        NSLog(@"%@", [toolbox findMultipleNum2:3 maxRange:10]);
//        NSLog(@"%@", [toolbox findMultipleNum2:5 maxRange:10]);
//        
//        
//        [toolbox addAllNum:123];
//        [toolbox addAllNum:5792];
//        
//        NSLog(@"3!: %lu",  [toolbox factorial:3]);
//        NSLog(@"5!: %lu",  [toolbox factorial:5]);
        
        //[toolbox game369:29];
        [toolbox printMultipleNumbers];
        //NSLog(@"Hello, World!");
        //[toolbox printStar:3];
        //[toolbox printReverseStar:5];
        
    }
    return 0;
}
