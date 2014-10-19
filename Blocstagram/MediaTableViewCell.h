//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/13/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media, MediaTableViewCell;

@protocol MediaTableViewCellDelegate <NSObject>

- (void) cell:(MediaTableViewCell *)mediaTableViewCell didTapImageView:(UIImageView *)imageView;
- (void) cell:(MediaTableViewCell *)mediaTableViewCell didLongPressImageView:(UIImageView *)imageView;

@end

@interface MediaTableViewCell : UITableViewCell
@property (nonatomic, strong) Media *mediaItem;
@property (nonatomic, weak) id <MediaTableViewCellDelegate> delegate;

+ (CGFloat) heightForMediaItem: (Media *)mediaItem width:(CGFloat)width;

@end
