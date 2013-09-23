//
//  CFPost.m
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "CFPost.h"

@implementation CFPost

+ (NSArray *)validUserNames //valid symbols getter, returns an array of the valid symbols
{
    return @[@"Russell Wilson", @"Richard Sherman"];
}

+ (NSArray *)validTitles //valid symbols getter, returns an array of the valid symbols
{
    return @[@"Go Hawks"];
}

+ (NSArray *)validContents //valid symbols getter, returns an array of the valid symbols
{
    return @[@"The Seahawks rock!!",@"Hooray football!!"];
}

+ (NSArray *)validTimeStamps //valid symbols getter, returns an array of the valid symbols
{
    return @[@"Just now"];
}




@end
