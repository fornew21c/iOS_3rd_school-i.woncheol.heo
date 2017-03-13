//
//  ViewController.m
//  Hackerton
//
//  Created by Woncheol on 2017. 3. 9..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "ViewController2.h"
#import "SettingViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>
@property UIScrollView *scrollView;
@property UIButton *closeBtn;

@property (weak, nonatomic) SettingViewController *settingVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUInteger cnt = 5;
    self.view.backgroundColor = [UIColor blackColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.navigationItem.titleView.frame.size.height)];
    //scrollView.backgroundColor = [UIColor greenColor];
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height- self.navigationItem.titleView.frame.size.height-100)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.navigationItem.title = @"제주도 혼자여행";

   // [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
   //                                               forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
   // self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
   // self.navigationController.navigationBar.translucent = YES;
   // self.navigationController.view.backgroundColor = [UIColor blackColor];
    
//    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftBarButtonTouched)];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
   // leftButton.frame = CGRectMake(0, 0, 48, 37);
    [leftButton addTarget:self action:@selector(leftBarButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    leftButton.showsTouchWhenHighlighted = YES;
    
    UIImage *leftButtonImage = [UIImage imageNamed:@"hamberg_360.png"];
    [leftButton setImage:leftButtonImage forState:UIControlStateNormal];
    
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
//    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(rightBarButtonTouched)];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(10, 0, 48, 48);
    [rightButton addTarget:self action:@selector(rightBarButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    rightButton.showsTouchWhenHighlighted = YES;
    
    UIImage *rightButtonImage = [UIImage imageNamed:@"list_360.png"];
    [rightButton setImage:rightButtonImage forState:UIControlStateNormal];
    
    //rightButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem =  rightBarButtonItem;
    
    NSArray *imgList = @[@"jeju1.jpg", @"jeju2.jpg", @"jeju3.jpg"];
    
    //views addObject:<#(nonnull id)#>
    for(NSUInteger i = 0; i < 3; i++) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height  - self.navigationItem.titleView.frame.size.height)];
//        //[views addObject:view];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height  - self.navigationItem.titleView.frame.size.height)];
        imageView.image = [UIImage imageNamed:[imgList objectAtIndex:i]];
        imageView.userInteractionEnabled = YES;
        UIButton *detailViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        detailViewBtn.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [detailViewBtn addTarget:self action:@selector(detailViewBtnTouched) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:detailViewBtn];
        //[view addSubview:imageView];
//        if(i==0) {
//            view.backgroundColor = [UIColor redColor];
//        }
//        else if(i==1) {
//            view.backgroundColor = [UIColor greenColor];
//        }
//        else if(i==2) {
//            view.backgroundColor = [UIColor grayColor];
//        }
//        else if(i==3) {
//            view.backgroundColor = [UIColor purpleColor];
//        }
//        else if(i==4) {
//            view.backgroundColor = [UIColor lightGrayColor];
//        }
        [self.scrollView addSubview:imageView];
    }
    
    
    
    //    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    //    view2.backgroundColor = [UIColor greenColor];
    //    [self.scrollView addSubview:view2];
    //
    //    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    //    view3.backgroundColor = [UIColor blueColor];
    //    [self.scrollView addSubview:view3];
    
    
    
    [self.view addSubview:self.scrollView];
    
    SettingViewController *settingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
    
    [self addChildViewController:settingVC];
    [self.view addSubview:settingVC.view];
    
    settingVC.view.frame = CGRectMake(- self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.settingVC = settingVC;
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(0, 60, 40, 40);
    [closeBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(didSelectedCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.hidden = YES;
    closeBtn.highlighted = NO;
    [self.view addSubview:closeBtn];
    self.closeBtn = closeBtn;
}

- (void)leftBarButtonTouched {
    NSLog(@"leftBarButtonTouched");
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(self.view.frame.size.width - 95, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
    self.closeBtn.hidden = NO;
}

- (void)rightBarButtonTouched {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"메인화면 보기 설정" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
//    
//    UIAlertAction *option1Action = [UIAlertAction actionWithTitle:@"페이지로 보기" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"option1");
//        //self application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//        [[DataCenter sharedInstance] setMyMainViewOption:@1];
//        
//
//    }];
//    
//    UIAlertAction *option2Action = [UIAlertAction actionWithTitle:@"리스트로 보기" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"option2.");
//        [[DataCenter sharedInstance] setMyMainViewOption:@2];
//    }];
//    
//    [alertController addAction:option1Action];
//    [alertController addAction:option2Action];
//    
//    [self presentViewController:alertController animated:YES completion:nil];
    NSLog(@"rightBarButtonTouched");
    ViewController2 *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2" ];
    [self.navigationController pushViewController:vc2 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectedCloseBtn:(UIButton *)sender {
    
    NSLog(@"didSelectedCloseBtn");
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
    self.closeBtn.hidden = YES;
}

- (void) detailViewBtnTouched{
    NSLog(@"detailViewBtnTouched");
}
@end
