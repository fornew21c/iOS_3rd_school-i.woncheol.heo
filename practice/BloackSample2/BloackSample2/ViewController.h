//
//  ViewController.h
//  BloackSample2
//
//  Created by Woncheol on 2017. 3. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//



#import <UIKit/UIKit.h>
typedef void(^simpleMethod)(NSString*);

@interface ViewController : UIViewController

@property simpleMethod simpleMethod;

@end

