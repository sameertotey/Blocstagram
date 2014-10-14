//
//  DataSouce.h
//  Blocstagram
//
//  Created by Sameer Totey on 10/13/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSouce : NSObject

@property (nonatomic, strong, readonly) NSArray *mediaItems;

+ (instancetype) sharedInstance;

- (void) deleteMediaItem: (Media *)mediaItem;

@end
