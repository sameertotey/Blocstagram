//
//  ImageLibraryViewController.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/26/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageLibraryViewController;

@protocol ImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibrayViewController:(ImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;

@end

@interface ImageLibraryViewController : UICollectionViewController
@property (nonatomic, weak) NSObject <ImageLibraryViewControllerDelegate> *delegate;

@end
