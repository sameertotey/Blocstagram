//
//  MediaFullScreenAnimator.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/18/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MediaFullScreenAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign)BOOL presenting;
@property (nonatomic, weak)UIImageView *cellImageView;

@end
