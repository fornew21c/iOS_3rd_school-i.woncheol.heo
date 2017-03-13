//
//  BlockView.m
//  BlockSample
//
//  Created by Woncheol on 2017. 3. 10..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame withAction:blockParam
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor purpleColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 100, 100, 50);
        btn.backgroundColor = [UIColor blueColor];
        [btn addTarget:self action:@selector(btnTouched) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 200, 50)];
        self.label.backgroundColor = [UIColor lightGrayColor];
        self.label.layer.borderWidth = 1;
        self.label.textColor = [UIColor blueColor];
        self.blockTemp = blockParam;
        [self addSubview:self.label];
    }
    return self;
}

- (void) btnTouched{
    NSLog(@"1234234234");
    self.label.text = self.blockTemp();
}
@end
