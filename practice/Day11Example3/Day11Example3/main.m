//
//  main.m
//  Day11Example3
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Figure *figure1 =  [[Figure alloc] init];
        [figure1 setFigureName:@"square"];
        [figure1 settingWidth:5.0];
        
        if( [[figure1 getFigureName] isEqualToString:@"square"] ) {
            NSLog(@"사각형이다");
        }
       // NSLog(@"Hello, World!");
    }
    return 0;
}
