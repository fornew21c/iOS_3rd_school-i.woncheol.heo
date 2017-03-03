//
//  AppDelegate.m
//  Navi
//
//  Created by Woncheol on 2017. 2. 21..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //*****************시작을 하는 메인스토리보드가
    //1. 윈도우 객체 만들기
    self.window= [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2. 뷰객체 만들기
    //2.1 생객체 만들기
    ViewController *vc = [[ViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    //2.2 스토리보드의 메인화면 사용하기
    UIStoryboard *sto = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //ViewController *vc = [sto instantiateViewControllerWithIdentifier:@"viewController"];
    
    //3. 네비게이션컨트롤러 객체 생성
    //UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UINavigationController *navi = [sto instantiateInitialViewController];
    
    //4. 루트뷰 세팅
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
