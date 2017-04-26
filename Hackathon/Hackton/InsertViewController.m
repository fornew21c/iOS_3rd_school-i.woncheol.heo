//
//  InsertViewController.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 12..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "InsertViewController.h"
#import "DataCenter.h"
#import "LoginViewController.h"
@import Firebase;

@interface InsertViewController ()
<UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *profileImg;
@property (weak, nonatomic) IBOutlet UITextField *anonymityTF;
@property (weak, nonatomic) IBOutlet UITextField *simpleTF;
@property (weak, nonatomic) LoginViewController *loginVC;

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    rightBtn.tag = 3;
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.profileImg.clipsToBounds = YES;
    self.profileImg.layer.cornerRadius = 50.0;
    
    self.anonymityTF.delegate = self;
    self.anonymityTF.tag = 0;
    self.simpleTF.delegate = self;
    self.simpleTF.tag = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)profileChangeAction:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }];
    
    UIAlertAction *chooseLibrary = [UIAlertAction actionWithTitle:@"Choose from library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:takePhoto];
    [alertController addAction:chooseLibrary];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.profileImg.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)addAction:(UIBarButtonItem *)sender{
    
    if (sender.tag == 3) {
        
        if ([FIRAuth auth].currentUser) {
            // User is signed in.
            NSLog(@"인증이 연결되어 있습니다.");
            
            // Get a reference to the storage service, using the default Firebase App
            FIRStorage *storage = [FIRStorage storage];
            // Create a storage reference from our storage service
            FIRStorageReference *storageRef = [storage referenceForURL:@"gs://hackton-5158e.appspot.com"];
            NSString *referenceUrl = @"";
            //    referenceUrl = [referenceUrl stringByAppendingString:@"/"];
            //        NSLog(@"%@", self.notiString);
            
            referenceUrl = [referenceUrl stringByAppendingString:[DataCenter shareData].webIDOfKey[self.indexPath]];
            referenceUrl = [referenceUrl stringByAppendingString:@"/anoymity/"];
            NSDate *todayDate = [NSDate date];
            NSString *dateStr = [NSString stringWithFormat:@"%@", todayDate];
            referenceUrl = [referenceUrl stringByAppendingString:dateStr];
            
            FIRStorageReference *riversRef = [storageRef child:referenceUrl];
            NSData *imgData = [[NSData alloc] init];
            if (self.profileImg.image != nil) {
                imgData = UIImagePNGRepresentation(self.profileImg.image);
                
            } else {
                self.profileImg.image = [UIImage imageNamed:@"free.jpg"];
                imgData = UIImagePNGRepresentation(self.profileImg.image);
            }
            
            // Upload the file to the path "images/rivers.jpg"
            FIRStorageUploadTask *uploadTask = [riversRef putData:imgData metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
                if (error != nil) {
                    // Uh-oh, an error occurred!
                } else {
                    // Metadata contains file metadata such as size, content-type, and download URL.
                    NSURL *downloadURL = metadata.downloadURL;
                    NSString *urlForDB = [NSString stringWithFormat:@"%@", downloadURL];
                    [[DataCenter shareData] anonymitySetProfileImg:urlForDB setAnoymity:self.anonymityTF.text setMainText:self.simpleTF.text setWebID:self.indexPath];
                    
                    NSLog(@"%@", downloadURL);
                }
            }];
//            [self popoverPresentationController];
             [self.navigationController popViewControllerAnimated:YES];
            
        } else {
            // No user is signed in.
            [self.simpleTF resignFirstResponder];
            [self.anonymityTF resignFirstResponder];
            [self pushLoginViewController];
            //        [UIView animateWithDuration:0.5 animations:^{
            //            self.loginVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            //        }];
            //
            
//            [self.navigationController ];
//            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        
    }
    
    
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.tag == 0) {
        self.anonymityTF.text = textField.text;
        [self.anonymityTF resignFirstResponder];
        
    } else {
        
        self.simpleTF.text = textField.text;
        [self.simpleTF resignFirstResponder];
    }
    
    
    
    return YES;
}

- (void)pushLoginViewController{
    
    UIStoryboard *logStoryBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    
    LoginViewController *loginVC = [logStoryBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:loginVC animated:YES];
//    [self presentViewController:loginVC animated:YES completion:nil];
//    [self addChildViewController:loginVC];
//    [self.view addSubview:loginVC.view];
    self.loginVC = loginVC;
//    loginVC.view.frame = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
}

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
