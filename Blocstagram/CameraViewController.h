//
//  CameraViewController.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/22/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;

@protocol CameraViewControllerDelegate <NSObject>

- (void) cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;

@end

@interface CameraViewController : UIViewController
@property (nonatomic, weak) NSObject <CameraViewControllerDelegate> *delegate;

@end
