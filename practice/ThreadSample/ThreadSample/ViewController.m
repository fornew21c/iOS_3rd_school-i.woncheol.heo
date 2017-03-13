//
//  ViewController.m
//  ThreadSample
//
//  Created by Woncheol on 2017. 3. 13..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSThread *thread2;
@property (nonatomic) NSUInteger stopTime;
@property (nonatomic) NSUInteger startTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.btn4 setEnabled:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadAction:) object:nil];

    [thread start];
    
     self.label2.text = @"완료";
}

- (void)threadAction:(NSString*)str{
    for(NSUInteger i = 0; i < 1000000; i++) {
        [self.label1 setText:[NSString stringWithFormat:@"%lu", i]];
        //NSLog(@"%lu", i);
    }
    
    
}

- (IBAction)btnAction2:(id)sender {
    self.startTime = 0;
    self.stopTime = 0;
    
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(threadAction2) object:nil];

    [self.thread2 start];
    
}

- (void)threadAction2 {
    if(self.stopTime != 0) {
        self.startTime = self.stopTime;
    }
    while(YES) {
        //sleep(1);
        
        [self performSelectorOnMainThread:@selector(timeChanged:) withObject:[NSString stringWithFormat:@"%lu", self.startTime] waitUntilDone:YES];
        //[NSThread sleepForTimeInterval:1];
        sleep(1);
        if([[NSThread currentThread] isCancelled]  == YES) {
            NSLog(@"cancel");
            //[NSThread exit];
            self.thread2 = nil;
            self.stopTime = self.startTime;
            break;
            
        }
        self.startTime++;

    }
}

- (void)timeChanged:(NSString *)str{
    [self.label3 setText:str];

}

- (IBAction)btnAction3:(id)sender {
    NSLog(@"btnAction3");
     [self.btn4 setEnabled:YES];
    [self.thread2 cancel];
}

- (IBAction)btnAction4:(id)sender {
    NSLog(@"%lu", self.stopTime);
    [self.btn4 setEnabled:NO];
    self.stopTime = 0;
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(threadAction2) object:nil];
    
    [self.thread2 start];

    //[self.thread2 start];
}

@end
