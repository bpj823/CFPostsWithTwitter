//
//  D1EditViewController.h
//  CFPosts
//
//  Created by Brad on 9/18/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1NewViewController.h"

@protocol SaveEditedPostDelegate <NSObject>

-(void)saveEditedPost:(NSArray *)data OnCell:(NSInteger)cell;
-(void)deletePost:(Post *)post WithCellNumber:(NSInteger)cell;


@end

@interface D1EditViewController : D1NewViewController

@property (nonatomic,assign) id <SaveEditedPostDelegate> delegate;
@property (nonatomic) NSInteger collectionCellNumber;
@property (nonatomic) NSNumber *remoteIDOfEdited;
@property (strong, nonatomic) IBOutlet UIImageView *myNewImage;


@end
