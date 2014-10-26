//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/18/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaFullScreenViewController : UIViewController
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) Media *media;
- (instancetype) initWithMedia:(Media *)media;

- (void)centerScrollView;

- (void)recalculateZoomScale;

@end
