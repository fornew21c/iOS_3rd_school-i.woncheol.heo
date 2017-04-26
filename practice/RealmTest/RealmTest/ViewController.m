//
//  ViewController.m
//  RealmTest
//
//  Created by Woncheol on 2017. 4. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "RealmData.h"

@interface ViewController ()

@end

@implementation ViewController

RLMRealm *realm;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
}

/**
 * 데이터 초기화
 */
- (void) initData{
    
    realm = [RLMRealm defaultRealm];
    NSLog(@">>> %@" , realm.path);
    
    
    //유저 데이터 반환
    RLMResults<User *> *userList = [self getUserList];
    NSLog(@">>> user  : %ld " , userList.count); // : 0
    
}


/**
 * 유저 데이터 반환
 */
- (RLMResults<User *> *) getUserList{
    RLMResults<User *> *userList = [User allObjects];
    return userList;
}


출처: http://iw90.tistory.com/262 [woong's]

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
