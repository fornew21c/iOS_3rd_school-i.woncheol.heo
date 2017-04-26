//
//  ViewController.m
//  SegueNavigation
//
//  Created by Woncheol on 2017. 3. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property BOOL isok;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isok = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonSelected:(id)sender {
    if (_isok) {
        [self performSegueWithIdentifier:@"DetailViewSegue" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
        DetailViewController *dvC = segue.destinationViewController;
        
        //detailViewController.label.text = @"test";
        dvC.receiveID = @"testtest";
    }
}


@end
