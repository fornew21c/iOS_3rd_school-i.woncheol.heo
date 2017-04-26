//
//  ViewController.m
//  imageDownload
//
//  Created by Woncheol on 2017. 3. 15..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                     @"http://www.sisaweek.com/news/photo/201507/48125_29713_1253.jpg"]]];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView2.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                     @"http://pds20.egloos.com/pds/201006/07/10/a0066110_4c0c7297c27f4.jpg"]]];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView3.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                     @"http://cfs1.tistory.com/upload_control/download.blog?fhandle=YmxvZzE1MDg0QGZzMS50aXN0b3J5LmNvbTovYXR0YWNoLzAvMTcuanBn"]]];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView4.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                     @"http://cfile210.uf.daum.net/image/23370C5050D65A920977A1"]]];
    });

//    self.imageView2.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
//                            @"http://pds20.egloos.com/pds/201006/07/10/a0066110_4c0c7297c27f4.jpg"]]];
//    self.imageView3.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
//                            @"http://cfs1.tistory.com/upload_control/download.blog?fhandle=YmxvZzE1MDg0QGZzMS50aXN0b3J5LmNvbTovYXR0YWNoLzAvMTcuanBn"]]];
//
//    self.imageView4.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
//                            @"http://cfile210.uf.daum.net/image/23370C5050D65A920977A1"]]];


    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
    
    self.scrollView.bounces = NO;
    
//    NSURL *thumbnailURL = [NSURL URLWithString:@"http://www.sisaweek.com/news/photo/201507/48125_29713_1253.jpg"];
//    NSURL *thumbnailURL2 = [NSURL URLWithString:@"http://pds20.egloos.com/pds/201006/07/10/a0066110_4c0c7297c27f4.jpg"];
//    NSURL *thumbnailURL3 = [NSURL URLWithString:@"http://cfs1.tistory.com/upload_control/download.blog?fhandle=YmxvZzE1MDg0QGZzMS50aXN0b3J5LmNvbTovYXR0YWNoLzAvMTcuanBn"];
//    NSURL *thumbnailURL4 = [NSURL URLWithString:@"http://cfile210.uf.daum.net/image/23370C5050D65A920977A1"];
//    
//    [self loadImageWithURL:thumbnailURL imageView:self.imageView];
//    [self loadImageWithURL:thumbnailURL2 imageView:self.imageView2];
//    [self loadImageWithURL:thumbnailURL3 imageView:self.imageView3];
//    [self loadImageWithURL:thumbnailURL4 imageView:self.imageView4];
    

    
    
}

- (void)loadImageWithURL:(NSURL *)url imageView:(UIImageView *)imageView
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                        if(data) {
                                            UIImage *image = [UIImage imageWithData:data];
                                            if(image) {
                                                dispatch_sync(dispatch_get_main_queue(), ^{
                                                    imageView.image = image;
                                                });
                                            }
                                        }
                                        
                                    }];
    [task resume];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
