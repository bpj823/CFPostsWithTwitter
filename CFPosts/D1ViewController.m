//
//  D1ViewController.m
//  CFPosts
//
//  Created by Brad on 9/10/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1ViewController.h"
#import "D1collectionviewcell.h"
#import <NSRails.h>
#import "Post.h"






@interface D1ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong,nonatomic) NSArray *postCollection;
@property (strong,nonatomic) NSMutableArray *updatedPosts;
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong,nonatomic) Post *editData;
@property (nonatomic) NSInteger selectedCell;
@property (nonatomic,strong) NSMutableDictionary *postPictures;






@end

@implementation D1ViewController

- (NSMutableDictionary *)postPictures
{
    if (!_postPictures)
    {
        _postPictures = [[NSMutableDictionary alloc]init];
    }
    
    return _postPictures;
}

- (void)convertArray:(NSArray *) toPost;
{
    
}

-(void)savePost:(NSArray *)data
{
    

    NSLog(@"delegation is working");
    Post *newPost = [[Post alloc] init];
    newPost.userName = data[0];
    newPost.title = data[1];
    newPost.body = data[2];
    //newPost.timeStamp = data[3];
    
    
    [newPost remoteCreate:nil];
    
    self.updatedPosts = [[NSMutableArray alloc] initWithArray:self.postCollection];
    
    [self.updatedPosts addObject:newPost];
    
    NSInteger index = [self.updatedPosts indexOfObject:newPost];
    
    NSString *indexString = [NSString stringWithFormat: @"%d",index ];
    
    [self.postPictures setObject:[data lastObject] forKey:indexString];
    
    self.postCollection = [[NSArray alloc]initWithArray:self.updatedPosts];
    
    [self.myCollectionView reloadData];
    
    
    
}
-(void)saveEditedPost:(NSArray *)data OnCell:(NSInteger)cell
{
    Post *newPost = [[Post alloc] init];
    newPost.userName = data[0];
    newPost.title = data[1];
    newPost.body = data[2];
    newPost.remoteObjectID = data[3];
    
    newPost.remoteID = newPost.remoteObjectID;
    

    
    self.updatedPosts = [[NSMutableArray alloc] initWithArray:self.postCollection];
    self.updatedPosts[cell] = newPost;
    self.postCollection = [[NSArray alloc]initWithArray:self.updatedPosts];
    
    [newPost remoteUpdate:nil];
    
    NSString *indexString = [NSString stringWithFormat: @"%d",cell ];
    
    [self.postPictures setObject:[data lastObject] forKey:indexString];
    
     [self.myCollectionView reloadData];
    
}

-(void)deletePost:(Post *)post WithCellNumber:(NSInteger)cell
{
    [post remoteDestroy:nil];
    
    self.updatedPosts = [[NSMutableArray alloc] initWithArray:self.postCollection];
    
    [self.updatedPosts removeObjectAtIndex:cell];
    
    self.postCollection = [[NSArray alloc]initWithArray:self.updatedPosts];
    
    [self.myCollectionView reloadData];
    
    
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
	self.postCollection = [Post remoteAll:nil];
    for(Post * post in self.postCollection){
        NSDictionary *hashFromRails = post.remoteAttributes;
        post.remoteObjectID =  hashFromRails[@"id"];
    }
    
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if ([segue.identifier isEqualToString:@"newBlogPost"])
    {
        D1NewViewController *newVC = segue.destinationViewController;
        newVC.delegate = self;
        
        
    }
    if ([segue.identifier isEqualToString:@"editBlogPost"])
    {
        D1EditViewController *editVC = segue.destinationViewController;
        editVC.delegate = self;
        Post *postEdit = self.editData;
        
        editVC.editPost = postEdit;
        editVC.collectionCellNumber = self.selectedCell;
        
        
        
        
        
    }
}

//START OF UICOLLECTIONVIEW DATASOURCE METHODS


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.postCollection count];
    
  
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
        
        Post *post = [self.postCollection objectAtIndex:indexPath.item];
        
        [self updateCell:cell usingPost:post];

           return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.editData = self.postCollection[indexPath.item];
    self.selectedCell = indexPath.item;
    [self performSegueWithIdentifier:@"editBlogPost" sender:self];

}


//END OF UICOLLECTIONVIEW DATASOURCE METHODS

-(void)updateCell:(UICollectionViewCell *)cell usingPost:(Post *)post
{
    D1PostView *postView = ((D1collectionviewcell *)cell).postView;
    
    

            Post *myPost = (Post *)post;
            postView.userName.text = myPost.userName;
            postView.title.text = myPost.title;
            postView.content.text = myPost.body;
            postView.timeStamp.text = @"just now";
    
    NSInteger index = [self.postCollection indexOfObject:post];
    
    NSString *indexString = [NSString stringWithFormat: @"%d",index ];
    
    if ([self.postPictures objectForKey:indexString])
    {
    postView.postImageView.image = [self.postPictures objectForKey:indexString];
    }
}
@end
