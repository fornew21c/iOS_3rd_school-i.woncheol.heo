//
//  ViewController.m
//  Example0216
//
//  Created by Woncheol on 2017. 2. 16..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "ContentController.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property UITableView *tableView;
@property NSUInteger numOfSections;
@property NSUInteger numOfRows;
@property NSArray *list;
@property NSArray *list2;
@property NSArray *imageList;
@property NSArray *sectionName;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
//    self.list = @[@"더킹", @"공조",  @"심연", @"라라랜드", @"루시드드림",  @"재심", @"싱글라이더", @"조작된 도시", @"배트맨 레고 무비", @"모아나"];
    self.imageList = @[@"theKing.jpg", @"gongjo.jpg", @"50shadow.jpg", @"lalaland.jpg", @"rusiddream.jpg", @"jaesim.jpg", @"singlerider.jpg", @"city.jpg", @"batman.jpg", @"moana.jpg"];
    
    self.list = @[ @{@"name":@"재심",@"image":@"jaesim.jpg"}, @{@"name":@"싱글라이더",@"image":@"singlerider.jpg"}, @{@"name":@"조작된 도시",@"image":@"city.jpg"}, @{@"name":@"배트맨 레고 무비",@"image":@"batman.jpg"}, @{@"name":@"모아나",@"image":@"moana.jpg"}];
    self.list2 = @[@{@"name":@"더킹",@"image":@"theKing.jpg"}, @{@"name":@"공조",@"image":@"gongjo.jpg"} , @{@"name":@"심연",@"image":@"50shadow.jpg"}, @{@"name":@"라라랜드",@"image":@"lalaland.jpg"}, @{@"name":@"루시드드림",@"image":@"rusiddream.jpg"}];
    [self.view addSubview:self.tableView];
    
    self.sectionName = @[@"개봉예정작",@"개봉작"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //self.numOfSections = 1;
    return self.sectionName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.numOfRows = self.list.count;
    return self.numOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
       // UISwitch *switcher = [[UISwitch alloc] initWithFrame:CGRectMake(10, 10, 10,10)];
       // [switcher addTarget:self action:@selector(actionMethod:) forControlEvents:UIControlEventValueChanged];
        //cell.accessoryView = switcher;
    }
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row + 1];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.list objectAtIndex:indexPath.row]];
    //cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed: [self.imageList objectAtIndex:indexPath.row]];
    if(indexPath.section == 0) {
        cell.textLabel.text = [[self.list objectAtIndex:indexPath.row] valueForKey:@"name"];
        cell.imageView.image = [UIImage imageNamed:[[self.list objectAtIndex:indexPath.row] valueForKey:@"image"]];
    }
    else if(indexPath.section == 1) {
        cell.textLabel.text = [[self.list2 objectAtIndex:indexPath.row] valueForKey:@"name"];
        cell.imageView.image = [UIImage imageNamed:[[self.list2 objectAtIndex:indexPath.row] valueForKey:@"image"]];
    }
    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [cell.textLabel setTextColor:[UIColor purpleColor]];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    

    //
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

- (void)actionMethod:(UISwitch*)sender {
    NSLog(@"touched");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSLog(@"%lu번째 row Touched", indexPath.row);
//
//    NSString *str =  [self.list objectAtIndex:indexPath.row];
//    UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"My Movie" message:[NSString stringWithFormat:@"%@ selected", str] preferredStyle:UIAlertControllerStyleAlert];
//    [self presentViewController:alert animated:YES completion:nil];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{[alert dismissViewControllerAnimated:YES completion:nil];});
    
 //   ViewController2
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"%@", selectedCell.textLabel.text);
    
    ContentController *cc = [[ContentController alloc] init];
    if(indexPath.section == 0) {
        cc.selectedImageName = [[self.list objectAtIndex:indexPath.row] valueForKey:@"image"];
    }
    else if(indexPath.section == 1) {
        cc.selectedImageName = [[self.list2 objectAtIndex:indexPath.row] valueForKey:@"image"];
        
    }
    [self presentViewController:cc animated:YES completion:nil];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return self.sectionName[section];
}
@end
