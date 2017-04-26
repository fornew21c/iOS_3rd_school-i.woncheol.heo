//
//  DetailViewController.h
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 11..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomHeaderView.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet CustomHeaderView *myHeaderView;
@property NSIndexPath *indexPath;
@end
