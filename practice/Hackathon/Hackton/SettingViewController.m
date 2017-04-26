//
//  SecViewController.m
//  170309 - 2 AddChildView
//
//  Created by Park Jae Han on 2017. 3. 9..
//  Copyright © 2017년 Park Jae Han. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCustomTableViewCell.h"
#import "DataCenter.h"
#import "ViewController.h"

@interface SettingViewController ()
<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *selectRegion;

@end

@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[DataCenter shareData].locationList count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[SettingCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = [[DataCenter shareData].locationList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithRed:108/255.0 green:108/255.0 blue:109/255.0 alpha:1];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor grayColor];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeBtnTouched {
    NSLog(@"closeBtnTouched");
//         self.view.frame = CGRectMake(self.view.frame.size.width - 95, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view removeFromSuperview];
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
