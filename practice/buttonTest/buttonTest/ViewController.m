//
//  ViewController.m
//  buttonTest
//
//  Created by Woncheol on 2017. 4. 18..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *myButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setFrame:CGRectMake(10.0f, 10.0f, 100.0f, 20.f)];
    [myButton setBackgroundColor:[UIColor blueColor]];
    [myButton setTitle:@"click me:" forState:UIControlStateNormal];
    //[myButton setTitle:@"changed" forState:UIControlStateSelected];
    //[myButton addTarget:self action:@selector(buttonHighlight:) forControlEvents:UIControlEventTouchDown];
    [myButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:myButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonTouched:(UIButton*)sender
{
    NSLog(@"selected:  %lu", sender.selected);
    
    if(sender.selected) {
        [sender setSelected:NO];
        sender.backgroundColor = [UIColor whiteColor];
    }
    else {
        [sender setSelected:YES];
        sender.backgroundColor = [UIColor blueColor];
    }
}

- (void)buttonNormal:(UIButton*)sender
{
    
}

//- (void) setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
//    
//    if (highlighted) {
//        self.backgroundColor = UIColorFromRGB(0x387038);
//    }
//    else {
//        self.backgroundColor = UIColorFromRGB(0x5bb75b);
//    }
//}
@end
