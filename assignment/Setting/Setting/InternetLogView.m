//
//  InternetLogView.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 22..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "InternetLogView.h"

@interface InternetLogView ()
<UITableViewDelegate, UITableViewDataSource>
@property UITableView *logTable;
@property NSArray *list;
@end

@implementation InternetLogView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.list = @[@"www.google.com", @"www.naver.com", @"www.daum.net", @"www.fastcampus.com"];
    self.navigationItem.title = @"인터넷 방문기록";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"trashcan"] forState:UIControlStateNormal];
    //UIImageView *trashImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trashcan"]];
    btn.frame = CGRectMake(0, 0, 35, 30);
    [btn addTarget:self action:@selector(rightBarBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *trashBarItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = trashBarItem;
    
    
    
    self.logTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.logTable.delegate = self;
    self.logTable.dataSource = self;
    [self.view addSubview:self.logTable];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)rightBarBtnTouched:(UIButton *)sender {
    [self.logTable removeFromSuperview];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    //cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row];
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
