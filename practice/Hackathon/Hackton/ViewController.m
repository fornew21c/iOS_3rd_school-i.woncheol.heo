//
//  ViewController.m
//  Hackerton
//
//  Created by Woncheol on 2017. 3. 9..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
//#import "ViewController2.h"
#import "SettingViewController.h"
#import "DetailViewController.h"
#import "SubViewController.h"
#import "DataCenter.h"

@interface ViewController ()
<UIScrollViewDelegate>
@property UIScrollView *scrollView;
@property UIButton *closeBtn;
@property (nonatomic) UIActivityIndicatorView *indicator;
@property (weak, nonatomic) SettingViewController *settingVC;
@property (nonatomic, weak) UIView *bottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
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
   leftButton.frame = CGRectMake(0, 0, 48, 37);
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
        [detailViewBtn addTarget:self action:@selector(detailViewBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
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
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    UIView *bottomView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.indicator.center = CGPointMake(bottomView.frame.size.width/2, bottomView.frame.size.height/2-50);
    self.bottomView = bottomView;
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.alpha = 0.7;
    bottomView.userInteractionEnabled = NO;
//    [self.scrollView addSubview:bottomView];
//    [bottomView addSubview:self.indicator];
//    [self.indicator startAnimating];
//    [self addObseverAction];
    
    //    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    //    view2.backgroundColor = [UIColor greenColor];
    //    [self.scrollView addSubview:view2];
    //
    //    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    //    view3.backgroundColor = [UIColor blueColor];
    //    [self.scrollView addSubview:view3];
    
    
    
    [self.view addSubview:self.scrollView];
    
    
//    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    closeBtn.frame = CGRectMake(0, 60, 40, 40);
//    [closeBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
//    [closeBtn addTarget:self action:@selector(didSelectedCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
//    closeBtn.hidden = YES;
//    closeBtn.highlighted = NO;
//    [self.view addSubview:closeBtn];
//    self.closeBtn = closeBtn;
}

- (void)leftBarButtonTouched {
    NSLog(@"leftBarButtonTouched");
    SettingViewController *settingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
    
    [self addChildViewController:settingVC];
    [self.view addSubview:settingVC.view];
    
    settingVC.view.frame = CGRectMake(- self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.settingVC = settingVC;
//    self.settingVC.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [UIView animateWithDuration:0.3 animations:^{
//        [self presentViewController:self.settingVC animated:YES completion:nil];
        
//        [self pus];
        self.settingVC.view.frame = CGRectMake(-30, 0, self.view.frame.size.width, self.view.frame.size.height);
//        self.view.frame = CGRectMake(self.view.frame.size.width - 95, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
    self.closeBtn.hidden = NO;
}

- (void)addObseverAction{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(indicatorAction:) name:@"stopIndicate" object:nil];
}

- (void)indicatorAction:(NSNotification *)sender{
    
    
    [self.indicator stopAnimating];
    [self.bottomView removeFromSuperview];
}


- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:@"stopIndicate"];
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
    SubViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"SubViewController" ];
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

- (void)detailViewBtnTouched:(UIButton *)sender{
    
    NSLog(@"detailViewBtnTouched");
    
    CGPoint offSet= self.scrollView.contentOffset;
    NSLog(@"%lf", offSet.x);
    if (offSet.x == 0) {
        NSInteger number = 0;
        [self pushViewControll:number];
    } else if (offSet.x >= 320.0 || offSet.x <= 375.0) {
        NSInteger number = 1;
        [self pushViewControll:number];
        
    } else if (offSet.x >= 640.0|| offSet.x <= 750.0) {
        NSInteger number = 2;
        [self pushViewControll:number];
    } else if (offSet.x == 1125.0) {
        NSInteger number = 3;
        [self pushViewControll:number];
    } else {
        
        NSLog(@"잘못눌림");
    }
    
}
- (void)pushViewControll:(NSInteger)num {
    
    if ( num < [[DataCenter shareData] webIDOfKey].count) {
        
        UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DetailViewController *tempVC = [mainStory instantiateViewControllerWithIdentifier:@"DetailViewController"];
        
//        NSIndexPath 
        tempVC.indexPath = [NSIndexPath indexPathForRow:num inSection:0];
        [[DataCenter shareData] replyCreateSetWebID:num];
        [self.navigationController pushViewController:tempVC animated:YES];
    } else {
        
        UIAlertController *temp = [UIAlertController alertControllerWithTitle:@"준비중입니다." message:@"죄송합니다. 컨텐츠 준비중입니다." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"확인");
        }];
        
        [temp addAction:okAction];
        
        [self presentViewController:temp animated:YES completion:nil];
        
    }
}




@end
