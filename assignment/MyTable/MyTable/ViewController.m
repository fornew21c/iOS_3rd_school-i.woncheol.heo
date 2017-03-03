//
//  ViewController.m
//  MyTable
//
//  Created by Woncheol on 2017. 2. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property NSArray *appList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    titleLb.text = @"인기차트";
    titleLb.textAlignment = 1;
    titleLb.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:titleLb];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 69, self.view.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.appList = @[@{@"icon":@"icon1", @"title":@"리니지2 레볼루션", @"genre":@"게임", @"review":@"review1"},
                     @{@"icon":@"icon2", @"title":@"카카오페이지", @"genre":@"도서", @"review":@"review6"},
                     @{@"icon":@"icon3", @"title":@"Pokemon GO", @"genre":@"게임", @"review":@"review3"},
                     @{@"icon":@"icon4", @"title":@"Super Mario Run", @"genre":@"게임", @"review":@"review4"},
                     @{@"icon":@"icon5", @"title":@"모두의마블 for Kakao", @"genre":@"게임", @"review":@"review5"},
                     @{@"icon":@"icon6", @"title":@"FIFA ONLINE 3 M by EA SPORTS", @"genre":@"게임", @"review":@"review6"},
                     @{@"icon":@"icon7", @"title":@"Analog Paris", @"genre":@"사진 및 비디오", @"review":@"review7"},
                     
                     @{@"icon":@"icon8", @"title":@"IV GO", @"genre":@"생산성", @"review":@"review8"},
                     @{@"icon":@"icon9", @"title":@"SMART TOUCH", @"genre":@"유틸리티", @"review":@"review9"},
                     @{@"icon":@"icon10", @"title":@"강철소녀", @"genre":@"게임", @"review":@"review10"}

                     
                     
                     
                     
                     ];
    
    
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //[[self.appList objectAtIndex:indexPath.row] valueForKey:@"icon"]
    
    [cell setDataWithRank:[NSString stringWithFormat:@"%lu", indexPath.row+1]
                     icon:[[self.appList objectAtIndex:indexPath.row] valueForKey:@"icon"]
                     title:[[self.appList objectAtIndex:indexPath.row] valueForKey:@"title"]
                     genre:[[self.appList objectAtIndex:indexPath.row] valueForKey:@"genre"]
                     review:[[self.appList objectAtIndex:indexPath.row] valueForKey:@"review"]];
        tableView.separatorInset = UIEdgeInsetsZero;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
