//
//  D1PostView.m
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1PostView.h"

@implementation D1PostView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.title.layer.cornerRadius = 5;
    self.content.layer.cornerRadius = 10;
    self.userName.layer.cornerRadius = 5;
    self.layer.cornerRadius = 30;
    
    self.postImageView.layer.cornerRadius = 37.5;
    self.postImageView.layer.masksToBounds = YES;
    
    
}


@end
