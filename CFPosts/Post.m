//
//  Post.m
//  CFPosts
//
//  Created by Brad on 9/16/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "Post.h"

@implementation Post

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController
{
    return @"string";
}

- (id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType
{
    return self.body;
}
@end
