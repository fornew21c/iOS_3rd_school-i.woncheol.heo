//
//  ViewController.m
//  Example0217
//
//  Created by Woncheol on 2017. 2. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomView.h"
#import "MyCustomTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    MyCustomView *customView = [[MyCustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
//    [customView setDataWithIMGName:@"godmina.jpg" name:@"woncheol" msg:@"고고고~~~!!!!!"];
//    [self.view addSubview:customView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCustomTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
         cell = [[MyCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell setDataWithIMGName:@"godmina.jpg" title:@"신민아" name:@"갓민아" msg:@"갓민아 짱짱~~~!!!"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 250;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
