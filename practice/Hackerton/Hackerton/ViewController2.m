//
//  ViewController2.m
//  Hackerton
//
//  Created by Woncheol on 2017. 3. 9..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController2.h"
#import "CustomTableViewCell.h"

@interface ViewController2 ()
<UITableViewDelegate,UITableViewDataSource>
@property NSArray *imgList;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"제주도 혼자여행";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftBarButtonTouched)];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(rightBarButtonTouched)];
    
    self.navigationItem.rightBarButtonItem =  rightBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBarButtonTouched {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   // if(cell == nil) {
//        UITableViewCell *cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    self.imgList = @[@"list1.jpg", @"list2.jpg", @"list3.jpg", @"list4.jpg"];
    
    cell.imageContent.image = [UIImage imageNamed:[self.imgList objectAtIndex:indexPath.row]];
    cell.imageContent.frame = CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.height-64)*0.25);
    //cell.imageContent.image = [UIImage imageNamed:@"list1.jpg"];
    //cell.textLabel.text = @"1234234";
  //  }
    
  //  cell.imageView.image = [UIImage imageNamed:@"jeju3.jpg"];
    //cell.imageContent.image = [UIImage imageNamed:@"jeju1.jpg"];
   // cell.textLabel.text = @"1";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (self.view.frame.size.height-64)*0.25;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
