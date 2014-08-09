//
//  ViewController.m
//  scrollViewFun
//
//  Created by Vensi Developer on 8/9/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import "ViewController.h"
#import "ScrollableCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,ScrollableCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *outerScrollView;


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController
            

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.outerScrollView.contentSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    
}


- (void)viewWillDisappear:(BOOL)animated {
    self.outerScrollView = nil;
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section
{
    return  10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ScrollableCollectionViewCell *reusedCell = (ScrollableCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell"    forIndexPath:indexPath];

    reusedCell.delegate = self;
    
    return reusedCell;
}

- (void)configureCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - ScrollableCollectionViewCell Delegate
- (void)scrollingCellDidBeginPulling:(ScrollableCollectionViewCell *)cell
{
    //so that the user can't interact with outer scrollView when the scrollView Cell is being scrolled
    [self.outerScrollView  setScrollEnabled:NO];
}
- (void)scrollingCell:(ScrollableCollectionViewCell *)cell didChangePullOffset:(CGFloat)offset
{
    //content offset 
    [self.outerScrollView setContentOffset:CGPointMake(offset,0) animated:YES];
}
- (void)scrollingCellDidEndPulling:(ScrollableCollectionViewCell *)cell
{
    [self.outerScrollView setScrollEnabled:YES];
}



@end

