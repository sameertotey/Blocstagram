//
//  DataSouce.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/13/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import "DataSouce.h"
#import "User.h"
#import "Media.h"
#import "Comment.h"


@interface DataSouce()
@property (nonatomic, strong, readwrite) NSArray *mediaItems;
@end

@implementation DataSouce

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype) init {
    self = [super init];
    
    if (self) {
        [self addRandomData];
    }
    return self;
}

- (void) deleteMediaItem: (Media *)mediaItem {
    NSUInteger index = [self.mediaItems indexOfObject:mediaItem];
    if (index != NSNotFound) {
        NSMutableArray *mutableCopyOfMediaItems = [[NSMutableArray alloc] init];
        [mutableCopyOfMediaItems addObjectsFromArray:self.mediaItems];
        [mutableCopyOfMediaItems removeObjectAtIndex:index];
        self.mediaItems = mutableCopyOfMediaItems;
    }
}


- (void) addRandomData {
    NSMutableArray *randomMediaItems = [NSMutableArray array];
    
    for (int i = 1; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        if (image) {
            Media *media = [[Media alloc] init];
            media.user = [self randomUser];
            media.image = image;
            
            NSMutableArray *randomComments = [NSMutableArray array];
            
            NSUInteger commentCount = arc4random_uniform(10);
            for (int j = 0; j < commentCount; j++) {
                Comment *randomComment = [self randomComment];
                [randomComments addObject:randomComment];
            }
            media.comments = randomComments;
            [randomMediaItems addObject:media];
        }
    }
    self.mediaItems = randomMediaItems;
}

- (User *) randomUser {
    User *user = [[User alloc] init];
    
    user.userName = [self randomStringOfLength:arc4random_uniform(10)];
    
    NSString *firstName = [self randomStringOfLength:arc4random_uniform(7)];
    NSString *lastName = [self randomStringOfLength:arc4random_uniform(12)];
    user.fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    return user;
}

- (Comment *) randomComment {
    Comment *comment = [[Comment alloc] init];
    
    comment.from = [self randomUser];
    
    NSMutableString *randomSentence = [[NSMutableString alloc] init];
    NSUInteger wordCount = arc4random_uniform(20);
    
    for (NSUInteger i = 0; i < wordCount; i++) {
        NSString *randomWord = [self randomStringOfLength:arc4random_uniform(12)];
        [randomSentence appendFormat:@"%@ ", randomWord];
    }
    comment.text = randomSentence;
    return comment;
}

- (NSString *) randomStringOfLength:(NSUInteger) length {
    NSString *alphabet = @"abcdefghijklmnopqrstuvwxyz";
    
    NSMutableString *s = [NSMutableString string];
    
    for (NSUInteger i = 0; i < length; i++) {
        NSUInteger r = arc4random_uniform((u_int32_t)[alphabet length]);
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    
    return [NSString stringWithString:s];
}

@end
