//
//  ViewController.h
//  StoryboardSample
//
//  Created by Woncheol on 2017. 2. 27..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet CustomView *customView1;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (nonatomic, weak) IBOutlet CustomView *customView2;
@property (nonatomic, weak) IBOutlet UIView *testView2;
@property (nonatomic, weak) IBOutlet UIButton *btn1;
@property (nonatomic, weak) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *testView;

@property (nonatomic, weak) IBOutlet CustomView *customView3;
- (IBAction) btnAction:(UIButton *) sender;

@end

