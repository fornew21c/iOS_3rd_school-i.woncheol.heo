//
//  ViewController.m
//  GCDSample
//
//  Created by Woncheol on 2017. 3. 13..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_queue_t queue = dispatch_queue_create("testqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"Call 1");
    });
    dispatch_async(queue, ^{
        NSLog(@"Call 2");
    });
    dispatch_async(queue, ^{
        NSLog(@"Call 3");
    });
    dispatch_async(queue, ^{
        NSLog(@"Call 4");
    });
    dispatch_async(queue, ^{
        NSLog(@"Call 5");
    });
}

- (IBAction)btnAction:(id)sender {
    __weak ViewController *wself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSUInteger i = 0;
        while(YES) {
//            [self performSelectorOnMainThread:@selector(timeChanged:) withObject:[NSString stringWithFormat:@"%lu", i] waitUntilDone:YES];
            //[NSThread sleepForTimeInterval:1];
            usleep(100000);
            dispatch_sync(dispatch_get_main_queue(), ^{
                [wself.label1 setText:[NSString stringWithFormat:@"%lu", i]];
            });
            if(i == 100) {
                break;
            }
            i++;
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timeChanged:(NSString *)str{
    [self.label1 setText:str];
    
}

@end
