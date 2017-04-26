//
//  ViewController.m
//  SeguqSample
//
//  Created by Woncheol on 2017. 3. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "FirstDetailView.h"
#import "SecondDetailView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1Touched:(id)sender {
    self.nextViewType = 1;
    [self performSegueWithIdentifier:@"FirstDetailView" sender:nil];
}


- (IBAction)btn2Touched:(id)sender {
    self.nextViewType = 2;
    [self performSegueWithIdentifier:@"SecondDetailView" sender:nil];
}

- (IBAction)moveBtnTouched:(id)sender {
    if(self.nextViewType == 1) {
        [self performSegueWithIdentifier:@"FirstDetailView" sender:nil];
        
    }
    else if(self.nextViewType == 2) {
        [self performSegueWithIdentifier:@"SecondDetailView" sender:nil];
    }
}

- (IBAction)backComplete:(UIStoryboardSegue*)unwindSegue
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"FirstDetailView"]) {
        NSLog(@"prepareForSegue");
        FirstDetailView *firstView = segue.destinationViewController;
        firstView.str1 = @"넘겨온 데이터";
    }
}
@end
