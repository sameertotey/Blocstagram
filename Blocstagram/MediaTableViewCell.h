//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/13/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaTableViewCell : UITableViewCell
@property (nonatomic, strong) Media *mediaItem;

+ (CGFloat) heightForMediaItem: (Media *)mediaItem width:(CGFloat)width;

@end
