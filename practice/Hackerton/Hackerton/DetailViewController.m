//
//  DetailViewController.m
//  DetailView
//
//  Created by abyssinaong on 2017. 3. 9..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewTableViewCell.h"
#import "CustomTableViewCell.h"
#import "DetailDataCenter.h"

@interface DetailViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *mainTableView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:mainTableView];
    self.mainTableView = mainTableView;
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.allowsSelection = NO;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 251;
            break;
            
        case 1:
            return 156;
            break;
        case 2:
            return 589;
            break;
        case 3:
            return 432.52;
            break;
        default:
            return 200;
            break;
            
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        CustomTableViewCell *cell = [[CustomTableViewCell alloc] initSectionZero] ;
        
        return cell;
    } else if (indexPath.row == 1){
        MapViewTableViewCell *cell = [[MapViewTableViewCell alloc] init];
        return cell;
    } else if (indexPath.row == 2){
        CustomTableViewCell *cell = [[CustomTableViewCell alloc] initSectionOne] ;
        return cell;
    } else if (indexPath.row == 3){
        CustomTableViewCell *cell = [[CustomTableViewCell alloc] initSectionTwo] ;
        return cell;
    } else {
        
        
        return nil;
    }
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
