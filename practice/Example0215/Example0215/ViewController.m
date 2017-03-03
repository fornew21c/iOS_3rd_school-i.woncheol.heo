//
//  ViewController.m
//  Example0215
//
//  Created by Woncheol on 2017. 2. 15..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *list;
@property NSArray *imageList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.list = @[@"코카콜라", @"웰치스", @"바리스타", @"삼다수", @"신민아"];
    self.imageList = @[@"cocacola.jpg",@"welchs.jpg",@"baristar.jpg",@"samdasu.jpg",@"godmina.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 10;
    }
    else if(section == 1) {
        return 5;
    }
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    //cell.textLabel.text = @"hi";
    //[cell.textLabel setTextColor:[UIColor blackColor]];
    if(indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%lu번째 row", indexPath.row+1];
    }
    else if(indexPath.section == 1){
//        if(indexPath.row  == 0) {
//            cell.textLabel.text = @"개";
//        }
//        else if(indexPath.row  == 1) {
//            cell.textLabel.text = @"고양이";
//        }
//        else if(indexPath.row  == 2) {
//            cell.textLabel.text = @"사자";
//        }
//        else if(indexPath.row  == 3) {
//            cell.textLabel.text = @"호랑이";
//        }
        cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
        [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.imageList objectAtIndex:indexPath.row]]]];
      //  cell setimage
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Setion %lu", section+1];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100.0;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   // UIAlertAction *alertAction = [UIAlertAction ] i
    NSLog(@"%lu번째 row Touched", indexPath.row);
    //UIAlertController *alert = [[UIAlertController alloc] init];
    //alert.textFields.text = @"테이블 터치";
    
    //alert.message = @"테이블 터치";

    //alert addAction:<#(nonnull UIAlertAction *)#>
    //[self.view addSubview:alert];
    if(indexPath.section  == 0) {
        UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"My Title" message:[NSString stringWithFormat:@"%lu번째 row touched", indexPath.row+1] preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{[alert dismissViewControllerAnimated:YES completion:nil];});
    }
    else {
        NSString *str =  [self.list objectAtIndex:indexPath.row];
        UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"My Title" message:[NSString stringWithFormat:@"%@ selected", str] preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{[alert dismissViewControllerAnimated:YES completion:nil];});
    }

}
@end
