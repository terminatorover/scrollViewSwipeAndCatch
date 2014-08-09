//
//  ScrollableCollectionViewCell.h
//  scrollViewFun
//
//  Created by Vensi Developer on 8/9/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ScrollableCollectionViewCellDelegate;


@interface ScrollableCollectionViewCell : UICollectionViewCell

@property UIColor *cellColor;
@property (nonatomic,weak)id<ScrollableCollectionViewCellDelegate> delegate;

@end

//protocol recordings
@protocol ScrollableCollectionViewCellDelegate <NSObject>

- (void)scrollingCellDidBeginPulling:(ScrollableCollectionViewCell *)cell ;
- (void)scrollingCell:(ScrollableCollectionViewCell *)cell didChangePullOffset:(CGFloat)offset;
- (void)scrollingCellDidEndPulling:(ScrollableCollectionViewCell *)cell;


@end