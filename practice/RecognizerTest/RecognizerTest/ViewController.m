//
//  ViewController.m
//  RecognizerTest
//
//  Created by Woncheol on 2017. 3. 2..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIGestureRecognizerDelegate>
@property UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UILabel *point;
@property CGPoint touchedPoint;
@property CGFloat x;
@property CGFloat y;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
   // UIPinchGestureRecognizer *pinGesture = [UIPinchGestureRecognizer allo] initWithTarget:<#(nullable id)#> action:<#(nullable SEL)#>
    //UILongPressGestureRecognizer
    self.tapGesture.delegate = self;
    //self.tapGesture.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:self.tapGesture];
    
    
}

- (void)handleTap:(UITapGestureRecognizer*) sender{
    NSLog(@"handleTap");
//    self.cnt = 0;
//    self.cnt++;

//    self.point.text = [NSString stringWithFormat:@"(%lf,%lf)", [sender locationInView:self.view].x, [sender locationInView:self.view].y];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press
{
    NSLog(@"gestureRecognizer shouldReceivePress");
//    CGPoint point = [self.tapGesture locationInView:self.view];
//    self.x = point.x;
//    self.y = point.y;
//    self.cnt++;
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    //self.cnt = 0;
    NSLog(@"gestureRecognizer shouldReceiveTouch");
    //CGPoint touchedPoint = [self.tapGesture locationInView:self.view];
//    self.x = touchedPoint.x;
//    self.y = touchedPoint.y;
    self.count.text = [NSString stringWithFormat:@"%lu", touch.tapCount];
    self.point.text = [NSString stringWithFormat:@"(%lf,%lf)", [touch locationInView:self.view].x, [touch locationInView:self.view].y];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
