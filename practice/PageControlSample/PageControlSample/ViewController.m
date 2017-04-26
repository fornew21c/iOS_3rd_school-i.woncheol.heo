//
//  ViewController.m
//  PageControlSample
//
//  Created by Woncheol on 2017. 2. 7..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>
@property UIScrollView *scrollView;
@property UIPageControl *page;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUInteger cnt = 5;
    self.view.backgroundColor = [UIColor blackColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //scrollView.backgroundColor = [UIColor greenColor];
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*5, self.scrollView.frame.size.height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    NSMutableArray<UIView *> *views;
    //views addObject:<#(nonnull id)#>
    for(NSUInteger i = 0; i < cnt; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [views addObject:view];
        if(i==0) {
            view.backgroundColor = [UIColor redColor];
        }
        else if(i==1) {
            view.backgroundColor = [UIColor greenColor];
        }
        else if(i==2) {
            view.backgroundColor = [UIColor grayColor];
        }
        else if(i==3) {
            view.backgroundColor = [UIColor purpleColor];
        }
        else if(i==4) {
            view.backgroundColor = [UIColor lightGrayColor];
        }
        [self.scrollView addSubview:view];
    }
    

    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//    view2.backgroundColor = [UIColor greenColor];
//    [self.scrollView addSubview:view2];
//    
//    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//    view3.backgroundColor = [UIColor blueColor];
//    [self.scrollView addSubview:view3];
    
    
    
//    [self.view addSubview:self.scrollView];
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(150, self.scrollView.frame.size.height, 100, 30)];
    //page.backgroundColor = [UIColor blackColor];
    self.page.numberOfPages = 3;
    self.page.currentPage = 0;
    [self.page addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.page];
    

    
    
   
    UISwitch *uiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 50, 100, 100)];
    [self.scrollView addSubview:uiSwitch];

    //NSArray *array = [[NSArray alloc] initWithObjects:<#(nonnull id), ...#>, nil];
    

    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
    //sc.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:sc];
    
}

- (void)pageChanged:(UIPageControl*) page {
    NSLog(@"current page: %lu", page.currentPage);
    if(page.currentPage == 1) {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0) animated:YES];
        
    }
    else if(page.currentPage == 2) {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width*2, 0) animated:YES];
    }
    else if(page.currentPage == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollView.contentOffset.x: %lf", scrollView.contentOffset.x);
    if(scrollView.contentOffset.x == 0) {
        self.page.currentPage = 0;
    }
    else if(scrollView.contentOffset.x == self.scrollView.frame.size.width) {
        self.page.currentPage = 1;
    }
    else if(scrollView.contentOffset.x == self.scrollView.frame.size.width*2) {
        self.page.currentPage = 2;
    }
    
    NSDictionary *ns = [[NSDictionary alloc] init];
    
    
}

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    NSLog(@"-------------");
//    if(scrollView.contentOffset.x == 0) {
//        self.page.currentPage = 0;
//    }
//    else if(scrollView.contentOffset.x == self.scrollView.frame.size.width) {
//        self.page.currentPage = 1;
//    }
//    else if(scrollView.contentOffset.x == self.scrollView.frame.size.width*2) {
//        self.page.currentPage = 2;
//    }
//}


@end
