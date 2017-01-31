//
//  main.m
//  Day11Example2
//
//  Created by Woncheol on 2017. 1. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"
#import "Cube.h"
#import "RectangleSolid.h"
#import "CircularCylinder.h"
#import "Sphere.h"
#import "Cone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Square *square1 =  [[Square alloc] init];
        [square1 setWidth:(5.4)];
        NSLog(@"이 정사각형의 넓이는 %.2lf입니다.", [square1 getArea]);
        NSLog(@"이 정사각형의 둘레는 %.2lf입니다.", [square1 getPerimeter]);
        
        Rectangle *rectangle =  [[Rectangle alloc] init];
        [rectangle setWidth:3.5];
        [rectangle setLength:4.6];
        NSLog(@"이 직사각형의 넓이는 %.2lf입니다.", [rectangle getArea]);
        NSLog(@"이 직사각형의 둘레는 %.2lf입니다.", [rectangle getPerimeter]);
        
        Circle *circle =  [[Circle alloc] init];
        [circle setRadian:(3)];
        NSLog(@"이 원의 넓이는 %.2lf입니다.", [circle getArea]);
        NSLog(@"이 원의 둘레는 %.2lf입니다.", [circle getCircumference]);
        
        Triangle *triangle =  [[Triangle alloc] init];
        [triangle setBottom:(3)];
        [triangle setHeight:(5)];
        NSLog(@"이 삼각형의 넓이는 %.2lf입니다.", [triangle getArea]);
        
        Cube *cube1 = [[Cube alloc] init];
        [cube1 setWidth:7];
        NSLog(@"이 정육면체의 부피는 %.2lf입니다.", [cube1 getVolume]);
        
        RectangleSolid *rc1 = [[RectangleSolid alloc] init];
        [rc1 setWidth:7];
        [rc1 setLength:6];
        [rc1 setHeight:15];
        NSLog(@"이 직육면체의 부피는 %.2lf입니다.", [rc1 getVolume]);
        
        CircularCylinder *cc1 = [[CircularCylinder alloc] init];
        [cc1 setRadian:7];
        [cc1 setHeight:15];
        NSLog(@"이 원통의 부피는 %.2lf입니다.", [cc1 getVolume]);
        
        Sphere *sphere =  [[Sphere alloc] init];
        [sphere setRadian:(3)];
        NSLog(@"이 구의 부피는 %.2lf입니다.", [sphere getVolume]);
        
        Cone *cone1 = [[Cone alloc] init];
        [cone1 setRadian:7];
        [cone1 setHeight:15];
        NSLog(@"이 원뿔의 부피는 %.2lf입니다.", [cone1 getVolume]);

        
    }
    return 0;
}
