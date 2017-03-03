//
//  ViewController.m
//  Example0213
//
//  Created by Woncheol on 2017. 2. 13..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDataSource>
@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    NSLog(@"loadView");
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableview.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
    NSLog(@"viewWillAppear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    
    NSLog(@"viewDidDisappear");
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"viewWillLayoutSubviews");
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"viewDidLayoutSubviews");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
