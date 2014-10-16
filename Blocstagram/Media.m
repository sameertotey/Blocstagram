//
//  Media.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/13/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import "Media.h"
#import "User.h"
#import "Comment.h"

@implementation Media

- (instancetype) initWithDictionary:(id)mediaDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = mediaDictionary[@"id"];
        self.user = [[User alloc] initWithDictionary:mediaDictionary[@"user"]];
        
        NSString *standardResolutionURLString = mediaDictionary[@"images"][@"standard_resolution"][@"url"];
        NSURL *standardResolutionURL = [NSURL URLWithString:standardResolutionURLString];
        
        if (standardResolutionURL) {
            self.mediaURL = standardResolutionURL;
        }
        
        NSDictionary *captionDictionary = mediaDictionary[@"caption"];
        
        // Caption might be null if there is no caption
        if ([captionDictionary isKindOfClass:[NSDictionary class]]) {
            self.caption = captionDictionary[@"text"];
        } else {
            self.caption = @"";
        }
        
        NSMutableArray *commentsArray = [NSMutableArray array];
        
        for (NSDictionary *commentDictionary in mediaDictionary[@"comments"][@"data"]) {
            Comment *comment = [[Comment alloc] initWithDictionary:commentDictionary];
            [commentsArray addObject:comment];
        }
        self.comments = commentsArray;
    }
    
    return self;
}
@end
