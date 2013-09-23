//
//  Post.h
//  CFPosts
//
//  Created by Brad on 9/16/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "NSRRemoteObject.h"

@interface Post : NSRRemoteObject <UIActivityItemSource>

@property (nonatomic, strong) NSString *title, *body,*userName;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic,strong) NSNumber *remoteObjectID;



@end
