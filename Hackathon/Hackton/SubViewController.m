//
//  ViewController.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 10..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "SubViewController.h"
#import "DataCenter.h"
#import "DetailViewController.h"
//#import "ViewController2.h"
#import "CustomTableViewCell.h"

@interface SubViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property NSArray *temp;
@property NSArray *imgList;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *temp = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"8",@"10"];
    self.temp = temp;
    
    
    
    self.navigationItem.title = @"제주도 혼자여행";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 48, 37);
    [leftButton addTarget:self action:@selector(leftBarButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    leftButton.showsTouchWhenHighlighted = YES;
    
    UIImage *leftButtonImage = [UIImage imageNamed:@"hamberg_360.png"];
    [leftButton setImage:leftButtonImage forState:UIControlStateNormal];
    
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(10, 0, 48, 48);
    [rightButton addTarget:self action:@selector(rightBarButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    rightButton.showsTouchWhenHighlighted = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    UIImage *rightButtonImage = [UIImage imageNamed:@"Onecolumn.png"];
    [rightButton setImage:rightButtonImage forState:UIControlStateNormal];
    
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem =  rightBarButtonItem;

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    self.imgList = @[@"list1.jpg", @"list2.jpg", @"list3.jpg", @"list4.jpg"];
    
    cell.imageContent.image = [UIImage imageNamed:[self.imgList objectAtIndex:indexPath.row]];
    cell.imageContent.frame = CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.height-64)*0.25);
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"osoadjfoia   %ld     %ld", indexPath.row , [[DataCenter shareData] webIDOfKey].count);
    if ( indexPath.row<[[DataCenter shareData] webIDOfKey].count) {
        
        UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DetailViewController *tempVC = [mainStory instantiateViewControllerWithIdentifier:@"DetailViewController"];
        tempVC.indexPath = indexPath;   
        [[DataCenter shareData] replyCreateSetWebID:indexPath.row];
        [self.navigationController pushViewController:tempVC animated:YES];
    } else {
        
        UIAlertController *temp = [UIAlertController alertControllerWithTitle:@"준비중입니다." message:@"죄송합니다. 컨텐츠 준비중입니다." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"확인");
        }];
        
        [temp addAction:okAction];
        
        [self presentViewController:temp animated:YES completion:nil];
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (self.view.frame.size.height-64)*0.25;
}

- (void)leftBarButtonTouched{
    
}

- (void)rightBarButtonTouched {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
