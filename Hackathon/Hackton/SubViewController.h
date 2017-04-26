//
//  ViewController.h
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 10..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface SubViewController : UIViewController
@property (nonatomic, strong) FIRDatabaseReference *ref;

@end

