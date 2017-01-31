//
//  main.m
//  Day11Example4
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CGFloat cm = [ToolBox inchToCm:2];
        NSLog(@"2인치는 %.3lfcm입니다.", cm);

        CGFloat inch = [ToolBox cmToInch:5];
        NSLog(@"5cm는 %.3lf인치입니다.", inch);
        
        CGFloat pyung = [ToolBox m2ToPyung:50];
        NSLog(@"50m2는 %.3lf평입니다.", pyung);
        
        CGFloat m2 = [ToolBox pyungToM2:34];
        NSLog(@"34평은 %.3lfm2입니다.", m2);
        
        CGFloat f = [ToolBox cToF:-5];
        NSLog(@"섭씨 -5도는 화씨 %.3lf도입니다.", f);
        
        CGFloat c = [ToolBox fToC:200];
        NSLog(@"화씨 34도는 섭씨 %.3lf도입니다.", c);
    }
    return 0;
}
