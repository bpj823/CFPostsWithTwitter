//
//  D1PostView.h
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface D1PostView : UIView



@property (strong,nonatomic) IBOutlet UILabel *title;
@property (strong,nonatomic) IBOutlet UILabel *content;
@property (strong,nonatomic) IBOutlet UILabel *userName;
@property (strong,nonatomic) IBOutlet UILabel *timeStamp;
@property (strong,nonatomic) IBOutlet UIImageView *postImageView;


@end
