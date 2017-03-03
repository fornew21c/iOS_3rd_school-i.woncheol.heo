//
//  ViewController.m
//  imagePicker
//
//  Created by Woncheol on 2017. 3. 2..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIGestureRecognizerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    self.imageView.layer.borderWidth = 1;
    
    UITapGestureRecognizer *tapGesture;
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureActioned:)];
    
    tapGesture.delegate =  self;
    tapGesture.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tapGesture];
}

- (void)gestureActioned:(UIGestureRecognizer*)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Image picker" message:@"이미지 가져오기" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
        cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraController.allowsEditing = NO;
        cameraController.delegate = self;
        [self presentViewController:cameraController animated:YES completion:nil];
        
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *libraryController = [[UIImagePickerController alloc] init];
        libraryController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        libraryController.allowsEditing = NO;
        libraryController.delegate = self;
        [self presentViewController:libraryController animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    
    BOOL cameraUseYn = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    if(cameraUseYn) {
        [actionSheet addAction:action1];
        [actionSheet addAction:action2];
        [actionSheet addAction:cancelAction];
    }
    else {
        [actionSheet addAction:action2];
        [actionSheet addAction:cancelAction];
    }
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouched:(UIButton*) sender{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Image picker" message:@"이미지 가져오기" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
        cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraController.allowsEditing = NO;
        cameraController.delegate = self;
        [self presentViewController:cameraController animated:YES completion:nil];
        
    }];
 
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *libraryController = [[UIImagePickerController alloc] init];
        libraryController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        libraryController.allowsEditing = NO;
        libraryController.delegate = self;
        [self presentViewController:libraryController animated:YES completion:nil];
        
    }];
    
    BOOL cameraUseYn = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    if(cameraUseYn) {
        [actionSheet addAction:action1];
        [actionSheet addAction:action2];
    }
    else {
        [actionSheet addAction:action2];
    }
    [self presentViewController:actionSheet animated:YES completion:nil];
                                      
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"info: %@", info);
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) gestureAction:(UIGestureRecognizer*) sender
{
    NSLog(@"gestureAction");
//    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Image picker" message:@"이미지 가져오기" preferredStyle:UIAlertControllerStyleActionSheet];
//    
//    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
//        cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
//        cameraController.allowsEditing = NO;
//        cameraController.delegate = self;
//        [self presentViewController:cameraController animated:YES completion:nil];
//        
//    }];
//    
//    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UIImagePickerController *libraryController = [[UIImagePickerController alloc] init];
//        libraryController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        libraryController.allowsEditing = NO;
//        libraryController.delegate = self;
//        [self presentViewController:libraryController animated:YES completion:nil];
//        
//    }];
//    
//    BOOL cameraUseYn = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
//    if(cameraUseYn) {
//        [actionSheet addAction:action1];
//        [actionSheet addAction:action2];
//    }
//    else {
//        [actionSheet addAction:action2];
//    }
//    [self presentViewController:actionSheet animated:YES completion:nil];
}
@end
