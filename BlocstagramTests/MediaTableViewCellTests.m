//
//  MediaTableViewCellTests.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/28/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MediaTableViewCell.h"
#import "Media.h"

@interface MediaTableViewCellTests : XCTestCase

@end

@implementation MediaTableViewCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatMediaTableViewCellReturnCorrectHeightForMediaItem {


    NSDictionary *sourceDictionary = @{@"id" : @"89A7PS064",
                                       @"images" : @{@"standard_resolution" : @{@"url" : @"http://www.sameertotey.com"}},
                                       @"user_had_liked" : @YES ,
                                       @"caption" : @{@"text": @"Caption text"},
                                       @"user" : @{@"id" : @"8675309",
                                                   @"username" : @"sameertotey",
                                                   @"full_name" : @"Sameer Totey",
                                                   @"profile_picture" : @"http://www.gravatar.com/avatar/e9ade3fc54fffb4d219330e62e94554a.png?s=144"}};
    Media *mediaItem = [[Media alloc] initWithDictionary:sourceDictionary];
    
    mediaItem.image = [UIImage imageNamed:@"1.jpg"];
    CGFloat itemHeight = [MediaTableViewCell heightForMediaItem:mediaItem width:320];
    XCTAssertEqual(itemHeight, 478, @"Item height should be 478");
    
    mediaItem.image = [UIImage imageNamed:@"image1.jpg"];
    itemHeight = [MediaTableViewCell heightForMediaItem:mediaItem width:320];
    XCTAssertEqual(itemHeight, 158, @"Item height should be 158");

    

}

@end
