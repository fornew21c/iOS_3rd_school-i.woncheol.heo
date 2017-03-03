//
//  ViewController.m
//  AlertControllerTest
//
//  Created by Woncheol on 2017. 3. 2..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *alert;
@property (weak, nonatomic) IBOutlet UIButton *actionSheet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // [self.alert addTarget:self action:@selector(alertbuttonTouched:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)alertbuttonTouched:(UIButton*)sender
//{
//    NSLog(@"alertbuttonTouched1");
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"얼럿창" message:@"얼럿창입니다." preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"OK버튼이 클릭되었습니다.");
//    }];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDefault handler:nil];
//    
//    [alertController addAction:okAction];
//    [alertController addAction:cancelAction];
//    
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//}
- (IBAction)alertButtonTouched
{
    NSLog(@"alertButtonTouched2");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Alert sytle." preferredStyle:UIAlertControllerStyleAlert];
                                          
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK버튼이 클릭되었습니다.");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    
//    UIAlertAction *ok2Action = [UIAlertAction actionWithTitle:@"확인2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"OK2버튼이 클릭되었습니다.");
//    }];
//    
//    UIAlertAction *ok3Action = [UIAlertAction actionWithTitle:@"확인3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"OK3버튼이 클릭되었습니다.");
//    }];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
//    [alertController addAction:ok2Action];
//    [alertController addAction:ok3Action];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (IBAction)actionSheetButtonTouched
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Action Sheet Style." preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK버튼이 클릭되었습니다.");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
