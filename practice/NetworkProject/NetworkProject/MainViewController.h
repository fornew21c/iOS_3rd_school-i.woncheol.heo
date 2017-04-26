//
//  MainViewController.h
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 16..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property NSMutableArray *postList;
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end
