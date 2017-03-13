//
//  ViewController.m
//  PlistTest
//
//  Created by Woncheol on 2017. 3. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "AddFriendViewController.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
//    
//    NSArray *list = [NSArray arrayWithContentsOfFile:filePath];
//   // NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
//    NSLog(@"list: %@", list);
    //UIImage *image = UIImage imageNamed:systemo
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftBarBtnTouched)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.view addSubview:self.tableView];
}

- (void)leftBarBtnTouched{
    AddFriendViewController *addFriendVC = [[AddFriendViewController alloc] initWithNibName:@"AddFriendViewController" bundle:nil];
    [self.navigationController pushViewController:addFriendVC animated:YES];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection: %lu", [[DataCenter sharedInstance] getSample].count);
    return  [[DataCenter sharedInstance] getSample].count;
//    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *tmpList = [[DataCenter sharedInstance] getSample];
   //NSLog(@"list: %@", tmpList);
    NSString *tempName = [[tmpList objectAtIndex:indexPath.row] objectForKey:@"Name"];
    NSString *tempCellPhone = [[tmpList objectAtIndex:indexPath.row] objectForKey:@"cellPhone"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"이름: %@ 전화번호: %@", tempName, tempCellPhone];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}
@end
