//
//  D1EditViewController.m
//  CFPosts
//
//  Created by Brad on 9/18/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1EditViewController.h"

@interface D1EditViewController ()
//@property (strong, nonatomic) IBOutlet UIImageView *myImageBox;
@property (nonatomic,strong) NSArray *enteredData;

@end

@implementation D1EditViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if (self.editPost)
    {
        [self receivePostData:self.editPost];
    }
}

-(void)receivePostData:(Post *)myPost
{
    
    self.userNameTextField.text = myPost.userName;
    self.titleTextField.text = myPost.title;
    self.contentTextField.text = myPost.body;
    self.remoteIDOfEdited = myPost.remoteID;
    //self.timeStampTextField.text = myPost.timeStamp;
    
}

-(IBAction)donePressed:(id)sender
{
    NSArray *myPhotoAray = [[NSArray alloc] initWithObjects:self.userNameTextField.text,self.titleTextField.text,self.contentTextField.text,self.remoteIDOfEdited, self.myNewImage.image, nil];
    
    self.enteredData = myPhotoAray;
    
    if([self.delegate respondsToSelector:@selector(savePost:)])
    {
        [self.delegate saveEditedPost:self.enteredData OnCell:self.collectionCellNumber];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)deletePressed:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(deletePost:WithCellNumber:)])
    {
        [self.delegate deletePost:self.editPost WithCellNumber:self.collectionCellNumber];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}




@end
