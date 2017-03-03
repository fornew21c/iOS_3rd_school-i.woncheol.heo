//
//  ViewController.m
//  PlistTest2
//
//  Created by Woncheol on 2017. 3. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()
<UITableViewDataSource,UITableViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
    
    NSArray *list = [NSArray arrayWithContentsOfFile:filePath];
    // NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"list: %@", list);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", [[DataCenter sharedInstance] getSample].count);
    return  [[DataCenter sharedInstance] getSample].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    
    NSArray *tmpList = [[DataCenter sharedInstance] getSample];
    NSString *tempName = [[tmpList objectAtIndex:indexPath.row] objectForKey:@"Name"];
    NSString *tempCellPhone = [[tmpList objectAtIndex:indexPath.row] objectForKey:@"cellPhone"];
    
    //    cell.textLabel.text = [NSString stringWithFormat:@"이름: %@ 전화번호: %@",
    //                           [[[[DataCenter sharedInstance] getSample] objectAtIndex:indexPath.row] objectForKey:@"Name"], [[[[DataCenter sharedInstance] getSample] objectAtIndex:indexPath.row] objectForKey:@"cellPhone"]];
    cell.textLabel.text = [NSString stringWithFormat:@"이름: %@ 전화번호: %@", tempName, tempCellPhone];
    
    
    
    return cell;
}
@end
