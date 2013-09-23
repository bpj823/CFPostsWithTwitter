//
//  D1PostCollection.m
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1PostCollection.h"

@implementation D1PostCollection

- (NSMutableArray *)myPosts
{
    if (!_myPosts)
    {
        _myPosts = [[NSMutableArray alloc]init];
    }
    
    return _myPosts;
}
- (id)init //designated initializer, creates a full set of posts
{
    self = [super init];
    
    if (self) {
        
        for (NSString *userName in [CFPost validUserNames])
        {
            for (NSString *title in [CFPost validTitles])
            {
                for (NSString *content in [CFPost validContents])
                {
                    for (NSString *timeStamp in [CFPost validTimeStamps])
                    {
                        CFPost *post = [[CFPost alloc] init];
                        post.userName = userName;
                        post.title = title;
                        post.content = content;
                        post.timeStamp = timeStamp;
                        post.backgroundColor = [UIColor randomColor];
                        [self.myPosts addObject:post];
                        
                    }
                }
            }
            
        }
        
        
        
    
    
        }
    return self;
}

@end
