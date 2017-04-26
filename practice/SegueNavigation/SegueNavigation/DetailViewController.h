//
//  DetailViewController.h
//  SegueNavigation
//
//  Created by Woncheol on 2017. 3. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSString *receiveID;

@end
