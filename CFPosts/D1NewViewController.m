//
//  D1NewViewController.m
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1NewViewController.h"
#import <Social/Social.h>

@interface D1NewViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, UIAlertViewDelegate>

@property (nonatomic,strong) NSArray *enteredData;
@property (nonatomic, weak) UIActionSheet *actionSheets;

@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;

@property (strong, nonatomic) IBOutlet UIImageView *myImageBox;

@end

@implementation D1NewViewController

-(IBAction)sharePressed:(id)sender
{
    
    UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:@[@"share text"] applicationActivities:nil];
    
    
    [self presentViewController:shareSheet animated:YES completion:nil];
    
    
}

-(IBAction)donePressed:(id)sender
{
    
    NSArray *myPhotoAray = [[NSArray alloc] initWithObjects:self.userNameTextField.text,self.titleTextField.text,self.contentTextField.text,self.myImageBox.image, nil];
    
    self.enteredData = myPhotoAray;
    
    if([self.delegate respondsToSelector:@selector(savePost:)])
    {
        [self.delegate savePost:self.enteredData];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  if (self)
  {
      
      
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(startImagePickuer:) ];
      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareToTwitter)];
	
    self.myNewImage.layer.cornerRadius = 37.5;
    self.myNewImage.layer.masksToBounds = YES;
  }
}

-(void)shareToTwitter
{
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:self.contentTextField.text];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (actionSheet.destructiveButtonIndex == buttonIndex)
    {
        UIImagePickerController *myImagePicker = [UIImagePickerController new];
        
        myImagePicker.delegate=self;
        
        myImagePicker.allowsEditing = YES;
        
        
        [self presentViewController:myImagePicker animated:YES completion:nil];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            myImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
        }
        else {
            UIAlertView *noCameraAlert = [[UIAlertView alloc]initWithTitle:@"Oh No!!" message:@"Your device does not have a camera, you idiot" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Photo Roll", nil];
            [noCameraAlert show];
            
            
        }
    }
        if (buttonIndex == 1)
        {
            
            
            [self choosePhotoFromCameraRoll];
        }
        
        
    
}
    




- (IBAction)startImagePickuer:(id)sender
{
    if (!self.actionSheets)
    {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose an Option Below" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Take New Photo" otherButtonTitles:@"Select Photo from Roll", nil];
    
    [actionSheet showFromBarButtonItem:sender animated:YES];
        self.actionSheets = actionSheet;
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *myImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.myNewImage.image = myImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self choosePhotoFromCameraRoll];
    }
    
    if (buttonIndex == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)choosePhotoFromCameraRoll
{
    UIImagePickerController *myImagePicker = [UIImagePickerController new];
    
    myImagePicker.delegate=self;
    
    myImagePicker.allowsEditing = YES;
    
    
    [self presentViewController:myImagePicker animated:YES completion:nil];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        myImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    
    if (textField.tag == 0) {
        UITextField *titleTextField = (UITextField *)[self.view viewWithTag:1];
        [titleTextField becomeFirstResponder];
    }
    if (textField.tag ==1) {
        UITextField *contentTextField = (UITextField *)[self.view viewWithTag:2];
        [contentTextField becomeFirstResponder];
        
    }
    
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
