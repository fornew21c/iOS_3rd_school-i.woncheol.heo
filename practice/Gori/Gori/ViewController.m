//
//  ViewController.m
//  Gori
//
//  Created by Woncheol on 2017. 3. 30..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "MainViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 //   FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
// 
//    loginButton.readPermissions =
//    @[@"public_profile", @"email", @"user_friends"];
//    
//    NSLog(@"currentAccessToken: %@", [FBSDKAccessToken currentAccessToken]);
//    if ([FBSDKAccessToken currentAccessToken]) {
//        // User is logged in, do work such as go to next view controller.
//        NSLog(@"login success");
//        //loginButton.hidden = TRUE;
//    }
//    
//    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
    [self.facebookLoginBtn addTarget:self action:@selector(loginButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginButtonTouched {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Logged in");
            [self performSegueWithIdentifier:@"mainViewSegue" sender:nil];

            
        }
    }];
    
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
    if(!error) {
        NSLog(@"You've logged in");
        NSLog(@"result: %@", result);
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    NSLog(@"You've logged out");
}
@end
