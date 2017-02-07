//
//  ViewController.m
//  VendingMachine
//
//  Created by Woncheol on 2017. 2. 5..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSInteger balance;
@property UILabel *displayLabel1;
@property UILabel *displayLabel2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUInteger margin = 10;
    NSUInteger offsetX = margin;
    NSUInteger offsetY = margin;
    
    UIView *drinkView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, 20, self.view.frame.size.width-margin*2, self.view.frame.size.height * 0.7)];
    drinkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:(drinkView)];
    
    
    UIView *itemView1 = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, drinkView.frame.size.width/2 - margin - margin/2, drinkView.frame.size.height*0.5 - margin*1.5)];
    itemView1.backgroundColor = [UIColor whiteColor];
    itemView1.layer.borderWidth = 1;
    itemView1.layer.borderColor = [UIColor purpleColor].CGColor;
    [drinkView addSubview:(itemView1)];
    offsetX += itemView1.frame.size.width + margin;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, itemView1.frame.size.width, itemView1.frame.size.height * 0.8)];
    imageView1.image = [UIImage imageNamed:@"cocacola.jpg"];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    [itemView1 addSubview:imageView1];
    
    UILabel *itemLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView1.frame.size.height+10, imageView1.frame.size.width, itemView1.frame.size.height * 0.2 - 10)];
    itemLabel1.text = @"1100원";
    itemLabel1.textAlignment = 1;
    [itemView1 addSubview:itemLabel1];
    
    UIButton *itemBtn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    itemBtn1.frame = CGRectMake(itemView1.frame.origin.x, itemView1.frame.origin.y, itemView1.frame.size.width , itemView1.frame.size.height);
    itemBtn1.backgroundColor = [UIColor redColor];
    itemBtn1.layer.borderWidth = 2;
    itemBtn1.alpha = 0.1;
    [itemBtn1 addTarget:self action:@selector(actionForItemBtn1Touch:) forControlEvents:UIControlEventTouchUpInside];

    [drinkView addSubview:itemBtn1];
                           
    
    UIView *itemView2 = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, drinkView.frame.size.width/2 - margin - margin/2, drinkView.frame.size.height*0.5 - margin*1.5)];
    itemView2.backgroundColor = [UIColor whiteColor];
    itemView2.layer.borderWidth = 1;
    itemView2.layer.borderColor = [UIColor purpleColor].CGColor;
    [drinkView addSubview:(itemView2)];
    offsetX = margin;
    offsetY = itemView2.frame.size.height + margin*2;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, itemView2.frame.size.width, itemView2.frame.size.height * 0.8)];
    imageView2.image = [UIImage imageNamed:@"welchs.jpg"];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    [itemView2 addSubview:imageView2];
    
    UILabel *itemLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView2.frame.size.height+10, imageView2.frame.size.width, itemView1.frame.size.height * 0.2 - 10)];
    itemLabel2.text = @"1200원";
    itemLabel2.textAlignment = 1;
    [itemView2 addSubview:itemLabel2];
    
    UIButton *itemBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    itemBtn2.frame = CGRectMake(itemView2.frame.origin.x, itemView2.frame.origin.y, itemView2.frame.size.width , itemView2.frame.size.height);
    itemBtn2.backgroundColor = [UIColor purpleColor];
    itemBtn2.layer.borderWidth = 2;
    itemBtn2.alpha = 0.1;
    [itemBtn2 addTarget:self action:@selector(actionForItemBtn2Touch:) forControlEvents:UIControlEventTouchUpInside];
    [drinkView addSubview:itemBtn2];
    
    
    
    UIView *itemView3 = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, drinkView.frame.size.width/2 - margin - margin/2, drinkView.frame.size.height*0.5 - margin*1.5)];
    itemView3.backgroundColor = [UIColor whiteColor];
    itemView3.layer.borderWidth = 1;
    itemView3.layer.borderColor = [UIColor purpleColor].CGColor;
    [drinkView addSubview:(itemView3)];
    offsetX += itemView1.frame.size.width + margin;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, itemView3.frame.size.width, itemView3.frame.size.height * 0.8)];
    imageView3.image = [UIImage imageNamed:@"baristar.jpg"];
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    [itemView3 addSubview:imageView3];
    
    UILabel *itemLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView3.frame.size.height+10, imageView3.frame.size.width, itemView3.frame.size.height * 0.2 - 10)];
    itemLabel3.text = @"1900원";
    itemLabel3.textAlignment = 1;
    [itemView3 addSubview:itemLabel3];
    
    UIButton *itemBtn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    itemBtn3.frame = CGRectMake(itemView3.frame.origin.x, itemView3.frame.origin.y, itemView3.frame.size.width , itemView3.frame.size.height);
    itemBtn3.backgroundColor = [UIColor greenColor];
    itemBtn3.layer.borderWidth = 2;
    itemBtn3.alpha = 0.1;
    [itemBtn3 addTarget:self action:@selector(actionForItemBtn3Touch:) forControlEvents:UIControlEventTouchUpInside];
    [drinkView addSubview:itemBtn3];
    
    UIView *itemView4 = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, drinkView.frame.size.width/2 - margin - margin/2, drinkView.frame.size.height*0.5 - margin*1.5)];
    itemView4.backgroundColor = [UIColor whiteColor];
    itemView4.layer.borderWidth = 1;
    itemView4.layer.borderColor = [UIColor purpleColor].CGColor;
    [drinkView addSubview:(itemView4)];
    
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, itemView4.frame.size.width, itemView4.frame.size.height * 0.8)];
    imageView4.image = [UIImage imageNamed:@"samdasu.jpg"];
    imageView4.contentMode = UIViewContentModeScaleAspectFit;
    [itemView4 addSubview:imageView4];
    
    UILabel *itemLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView3.frame.size.height+10, imageView3.frame.size.width, itemView3.frame.size.height * 0.2 - 10)];
    itemLabel4.text = @"800원";
    itemLabel4.textAlignment = 1;
    [itemView4 addSubview:itemLabel4];

    UIButton *itemBtn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    itemBtn4.frame = CGRectMake(itemView4.frame.origin.x, itemView4.frame.origin.y, itemView4.frame.size.width , itemView4.frame.size.height);
    itemBtn4.backgroundColor = [UIColor whiteColor];
    itemBtn4.layer.borderWidth = 2;
    itemBtn4.alpha = 0.1;
    [itemBtn4 addTarget:self action:@selector(actionForItemBtn4Touch:) forControlEvents:UIControlEventTouchUpInside];
    [drinkView addSubview:itemBtn4];
    
    UIView *displayView = [[UIView alloc] initWithFrame:CGRectMake(margin*2, drinkView.frame.size.height+margin*2, drinkView.frame.size.width-margin*2, self.view.frame.size.height * 0.14)];
    displayView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:(displayView)];
    
    
    self.displayLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, displayView.frame.size.width, displayView.frame.size.height * 0.5)];
    
    self.displayLabel1.text = @"";
    self.displayLabel1.textAlignment = 2;
    self.displayLabel1.textColor = [UIColor greenColor];
    self.displayLabel1.font = [UIFont systemFontOfSize:15];
    [displayView addSubview:self.displayLabel1];
    
    self.displayLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(displayView.frame.size.width*0.25, displayView.frame.size.height*0.5, displayView.frame.size.width*0.75, displayView.frame.size.height * 0.5)];
    self.balance = 0;
    self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    self.displayLabel2.textAlignment = 2;
    
    self.displayLabel2.textColor = [UIColor greenColor];
    self.displayLabel2.font = [UIFont systemFontOfSize:20];
    [displayView addSubview:self.displayLabel2];
    
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(margin*2, self.view.frame.size.height*0.84+30, drinkView.frame.size.width-margin*2, self.view.frame.size.height * 0.08)];
    inputView.backgroundColor = [UIColor greenColor];
//  inputView.alpha = 0.7;
    [self.view addSubview:(inputView)];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(30, 10, inputView.frame.size.width/3 - 40, inputView.frame.size.height - 20);
    btn1.layer.borderWidth = 2;
    btn1.backgroundColor = [UIColor grayColor];
    //btn1.alpha = 0.4;
    [btn1 setTitle:@"1000원" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(actionForBtn1Touch:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:btn1];
    offsetX = 20 + btn1.frame.size.width + 42;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(offsetX, 10, inputView.frame.size.width/3 - 40, inputView.frame.size.height - 20);
    btn2.layer.borderWidth = 2;
    btn2.backgroundColor = [UIColor grayColor];
    //btn2.alpha = 0.4;
    [btn2 setTitle:@"500원" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(actionForBtn2Touch:) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:btn2];
    offsetX = 20 + btn1.frame.size.width + 50 + btn2.frame.size.width + 20;
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(offsetX, 10, inputView.frame.size.width/3 - 40, inputView.frame.size.height - 20);
    btn3.layer.borderWidth = 2;
    btn3.backgroundColor = [UIColor grayColor];
    //btn3.alpha = 0.4;
    [btn3 setTitle:@"100원" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [btn3 addTarget:self action:@selector(actionForBtn3Touch) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:btn3];
                      
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) actionForBtn1Touch:(UIButton *) sender {
    self.balance += 1000;
    self.displayLabel1.text = @"";
    self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
}

- (void) actionForBtn2Touch:(UIButton *) sender {
    self.balance += 500;
    self.displayLabel1.text = @"";
    self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    
}

- (void) actionForBtn3Touch {
    self.balance += 100;
    self.displayLabel1.text = @"";
    self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    
}

- (void) actionForItemBtn1Touch:(UIButton *) sender {
    self.balance -= 1100;
    if(self.balance < 0) {
        self.displayLabel1.text = [NSString stringWithFormat:@"잔액이 부족합니다."];
        self.balance += 1100;
        
    }
    else {
        self.displayLabel1.text = [NSString stringWithFormat:@"콜라가 나왔습니다. 맛있게 드세요~!"];
        self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    }
}

- (void) actionForItemBtn2Touch:(UIButton *) sender {
    self.balance -= 1200;
    if(self.balance < 0) {
        self.displayLabel1.text = [NSString stringWithFormat:@"잔액이 부족합니다."];
        self.balance += 1200;
        
    }
    else {
        self.displayLabel1.text = [NSString stringWithFormat:@"웰치스가 나왔습니다. 맛있게 드세요~!"];
        self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    }
}

- (void) actionForItemBtn3Touch:(UIButton *) sender {
    self.balance -= 1900;
    if(self.balance < 0) {
        self.displayLabel1.text = [NSString stringWithFormat:@"잔액이 부족합니다."];
        self.balance += 1900;
        
    }
    else {
        self.displayLabel1.text = [NSString stringWithFormat:@"바리스타가 나왔습니다. 맛있게 드세요~!"];
        self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    }
}

- (void) actionForItemBtn4Touch:(UIButton *) sender {
    self.balance -= 800;
    if(self.balance < 0) {
        self.displayLabel1.text = [NSString stringWithFormat:@"잔액이 부족합니다."];
        self.balance += 800;
        
    }
    else {
        self.displayLabel1.text = [NSString stringWithFormat:@"삼다수가 나왔습니다. 맛있게 드세요~!"];
        self.displayLabel2.text = [NSString stringWithFormat:@"잔액 : %lu 원", self.balance];
    }
}
@end
