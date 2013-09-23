//
//  CFPost.h
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFPost : NSObject

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *timeStamp;
@property (nonatomic,strong) UIColor *backgroundColor;


+(NSArray *)validUserNames;
+(NSArray *)validTitles;
+(NSArray *)validContents;
+(NSArray *)validTimeStamps;


@end
