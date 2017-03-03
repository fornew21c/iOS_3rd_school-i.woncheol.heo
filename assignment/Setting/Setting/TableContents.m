//
//  TableContents.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 22..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "TableContents.h"
#import "AccountInfo.h"
#import "InternetLogView.h"
#import "ImageView.h"
#import "DataCenter.h"
#import "NotiView.h"

@interface TableContents ()
<UITableViewDelegate, UITableViewDataSource>
@property NSIndexPath *indexPath;
@property UITableView *tableView;
@end

@implementation TableContents

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Setting";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 5;
    }
    else if(section == 1) {
        return 5;
    }
    else if(section == 2){
        return 6;
    }
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    [cell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    NSLog(@"indexPath.section: %lu", indexPath.section);
    if(indexPath.section == 0) {
       // UIImage *image = [UIImage imageNamed:@"arrow"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrowf"]];
        imageView.frame = CGRectMake(0, 0, 40, 30);
        cell.accessoryView = imageView;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        //선택된 셀 체크하기
//        if([self.indexPath isEqual:indexPath]) {
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        }
//        else {
//            cell.accessoryType = UITableViewCellAccessoryNone;
//        }
        
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"네이버 계정 정보";
                cell.detailTextLabel.text = @"";
                break;
            case 1:
                cell.textLabel.text = @"세팅현황 보기";
                cell.detailTextLabel.text = @"스위치 온오프 상태를 확인할 수 있습니다.";
                cell.detailTextLabel.numberOfLines = 2;
                break;
            case 2:
                cell.textLabel.text = @"인터넷 사용 기록";
                cell.detailTextLabel.text = @"이 기기의 방문 URL 기록, 쿠키, 다운로드 파일 관리";
                break;
            case 3:
                cell.textLabel.text = @"캐시 삭제";
                cell.detailTextLabel.text = @"캐시에 저장된 콘텐츠와 데이터 삭제";
                cell.accessoryView = nil;
                break;
            case 4:
                cell.textLabel.text = @"네이버앱 기본 브라우저로 세팅";
                cell.accessoryView = nil;
                break;
            default:
                break;
        }
    }
    else if(indexPath.section == 1) {
        UISwitch *swicher = [[UISwitch alloc] init];
        [swicher addTarget:self action:@selector(swicherValueChanged:) forControlEvents:UIControlEventValueChanged];

        cell.accessoryView = swicher;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"네이버앱을 기본 브라우저로 설정";
                cell.detailTextLabel.text = @"";
                if( [[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher1"] boolValue] ) {
                    [swicher setOn:YES];
                }
                else {
                    [swicher setOn:NO];
                }
                break;
            case 1:
                cell.textLabel.text = @"네이버 브라우저엔진(V2)";
                cell.detailTextLabel.text = @"웹 페이지를 보다 안정적으로 보기 Wi-fi 상태에서 버전 자동 업데이트";
                //cell.detailTextLabel.frame = CGRectMake(0, 0, self.view.frame.size.width*0.7, self.view.frame.size.height);
                cell.detailTextLabel.numberOfLines = 3;
                if( [[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher2"] boolValue]) {
                    [swicher setOn:YES];
                }
                else {
                    [swicher setOn:NO];
                }
                break;
            case 2:
                cell.textLabel.text = @"글자 크게 보기";
                cell.detailTextLabel.text = @"";
                if( [[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher3"] boolValue]) {
                    [swicher setOn:YES];
                }
                else {
                    [swicher setOn:NO];
                }
                break;
            case 3:
                cell.textLabel.text = @"웹페이지 팝업 차단";
                cell.detailTextLabel.text = @"";
                if( [[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher4"] boolValue]) {
                    [swicher setOn:YES];
                }
                else {
                    [swicher setOn:NO];
                }
                break;
            case 4:
                if( [[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher5"] boolValue]) {
                    [swicher setOn:YES];
                }
                else {
                    [swicher setOn:NO];
                }
                cell.textLabel.text = @"링크 새창 열기";
                cell.detailTextLabel.text = @"";
                break;
            default:
                break;
        }
    }
    else if(indexPath.section == 2) {
        UISwitch *swicher = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [swicher addTarget:self action:@selector(swicherValueChanged:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = swicher;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"푸쉬알림 받기";
                cell.detailTextLabel.text = @"";
                break;
            case 1:
                cell.textLabel.text = @"배지알림 받기";
                cell.detailTextLabel.text = @"";
                break;
            case 2:
                cell.textLabel.text = @"알림 수신 설정";
                cell.detailTextLabel.text = @"";
                break;
            case 3:
                cell.textLabel.text = @"푸시알림 스타일 설정";
                cell.detailTextLabel.text = @"소리, 진동, 에티켓 시간 등 설정";
                break;
            case 4:
                cell.textLabel.text = @"현재 날씨와 예보";
                cell.detailTextLabel.text = @"현재 날씨 알림 삭제되지 않게 고정";
                break;
            case 5:
                cell.textLabel.text = @"이 기기 상태바에 업데이트 알림";
                cell.detailTextLabel.text = @"네이버 앱센터 내 업데이트 정보를 표시";
                break;
            default:
                break;
        }
    }
    return cell;
}

- (void)swicherValueChanged:(UISwitch *)sender
{
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[sender superview]];
    UITableViewCell *selectedCell = (UITableViewCell *) [sender superview];
 
    NSLog(@"indexPath.section: %lu", indexPath.section );
    NSLog(@"indexPath.row : %lu", indexPath.row );
    NSLog(@"Switch is %lu",(NSUInteger)sender.isOn);
    NSNumber *switcher1;
    NSNumber *switcher2;
    NSNumber *switcher3;
    NSNumber *switcher4;
    NSNumber *switcher5;
    

    
    if(indexPath.row == 0) {
        if(sender.isOn) {
            [DataCenter sharedInstance].swichStr1 = [NSString stringWithFormat:@"%@이 On되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher1 = YES;
            switcher1 = [NSNumber numberWithBool:YES];
        }
        else  {
            [DataCenter sharedInstance].swichStr1 = [NSString stringWithFormat:@"%@이 Off되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher1 = NO;
            switcher1 = [NSNumber numberWithBool:NO];
        }
        [[NSUserDefaults standardUserDefaults] setObject:switcher1 forKey:@"switcher1"];
       // [[NSUserDefaults standardUserDefaults] setObject:switcher1 forKey:@"switcher1"];
        NSLog(@"NSUserDefaults %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher1"]);
    }
    else if(indexPath.row == 1) {
        if(sender.isOn) {
            [DataCenter sharedInstance].swichStr2 = [NSString stringWithFormat:@"%@이 On되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher2 = YES;
            switcher2 = [NSNumber numberWithBool:YES];
           
        }
        else {
            [DataCenter sharedInstance].swichStr2 = [NSString stringWithFormat:@"%@이 Off되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher2 = NO;
            switcher2 = [NSNumber numberWithBool:NO];
            
          //  sender.isOn ? "YES" : "NO"
        }
         [[NSUserDefaults standardUserDefaults] setObject:switcher2 forKey:@"switcher2"];
        NSLog(@"NSUserDefaults %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher2"]);
    }
    else if(indexPath.row == 2) {
        if(sender.isOn) {
            [DataCenter sharedInstance].swichStr3 = [NSString stringWithFormat:@"%@이 On되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher3 = YES;
            switcher3 = [NSNumber numberWithBool:YES];
        }
        else {
            [DataCenter sharedInstance].swichStr3 = [NSString stringWithFormat:@"%@이 Off되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher3 = NO;
            switcher3 = [NSNumber numberWithBool:NO];
        }
        [[NSUserDefaults standardUserDefaults] setObject:switcher3 forKey:@"switcher3"];
    }
    else if(indexPath.row == 3) {
        if(sender.isOn) {
            [DataCenter sharedInstance].swichStr4 = [NSString stringWithFormat:@"%@이 On되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher4 = YES;
            switcher4 = [NSNumber numberWithBool:YES];
        }
        else {
            [DataCenter sharedInstance].swichStr4 = [NSString stringWithFormat:@"%@이 Off되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher4 = NO;
            switcher4 = [NSNumber numberWithBool:NO];
        }
        [[NSUserDefaults standardUserDefaults] setObject:switcher4 forKey:@"switcher4"];
    }
    else if(indexPath.row == 4) {
        if(sender.isOn) {
            [DataCenter sharedInstance].swichStr5 = [NSString stringWithFormat:@"%@이 On되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher5 = YES;
            switcher5 = [NSNumber numberWithBool:YES];
        }
        else {
            [DataCenter sharedInstance].swichStr5 = [NSString stringWithFormat:@"%@이 Off되었습니다.", selectedCell.textLabel.text];
            [DataCenter sharedInstance].swicher5 = NO;
            switcher5 = [NSNumber numberWithBool:NO];
        }
        [[NSUserDefaults standardUserDefaults] setObject:switcher5 forKey:@"switcher5"];
    }
//    NSLog(@"indexPath.section: %lu, indexpath.row: %lu", indexPath.section, indexPath.row);
//    NSLog(@"Switch is %lu",(NSUInteger)sender.isOn);
     NSLog(@"%@가 %lu되었습니다.", selectedCell.textLabel.text, (NSUInteger)sender.isOn);
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row == 0) {
        return 50;
    }
    else {
        return 75;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0) {
        return @"내 정보";
    }
    else if(section == 1) {
        return @"브라우저 기능";
    }
    else {
        return @"알림";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    self.indexPath = indexPath;
//    [tableView reloadData];
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", selectedCell.textLabel.text);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            AccountInfo *ai = [[AccountInfo alloc] initWithNibName:@"AccountInfo" bundle:nil];
            [self.navigationController pushViewController:ai animated:YES];
            
        }
        else if(indexPath.row == 1) {
            ImageView *iView = [[ImageView alloc] initWithNibName:@"ImageView" bundle:nil];
            [iView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:iView animated:YES completion:nil];
            
        }
        else if(indexPath.row == 2) {
            InternetLogView *iLogV = [[InternetLogView alloc] initWithNibName:@"InternetLogView" bundle:nil];
             [self.navigationController pushViewController:iLogV animated:YES];
            
        }
        else if(indexPath.row == 4) {
            NotiView *notiV = [[NotiView alloc] initWithNibName:@"NotiView" bundle:nil];
            [self.navigationController pushViewController:notiV animated:YES];
            
        }
    }
}

- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated
{
    NSLog(@"deselectRowAtIndexPath: %lu", indexPath.row);
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
