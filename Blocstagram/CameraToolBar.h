//
//  CameraToolbar.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/22/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CameraToolbar;

@protocol CameraToolBarDelegate <NSObject>
- (void) leftButtonPressedOnToolbar:(CameraToolbar *)toolbar;
- (void) rightButtonPressedOnToolbar:(CameraToolbar *)toolbar;
- (void) cameraButtonPressedOnToolbar:(CameraToolbar *)toolbar;

@end

@interface CameraToolbar : UIView
@property(nonatomic, weak) NSObject <CameraToolBarDelegate> *delegate;

- (instancetype) initWithImageNames:(NSArray *)imageNames;

@end
