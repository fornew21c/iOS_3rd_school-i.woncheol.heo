//
//  BlockView.h
//  BlockSample
//
//  Created by Woncheol on 2017. 3. 10..
//  Copyright © 2017년 fornew21c. All rights reserved.
//


#import <UIKit/UIKit.h>
typedef NSString* (^BlockParam)(void);

//@protocol BlockViewDelegate;

@interface BlockView : UIView
@property BlockParam blockTemp;
@property UILabel *label;
- (instancetype)initWithFrame:(CGRect)frame withAction:BlockParam;

@end
