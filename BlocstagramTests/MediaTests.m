//
//  MediaTests.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/28/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Media.h"
#import "LikeButton.h"

@interface MediaTests : XCTestCase

@end

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializerWorks {
    NSDictionary *sourceDictionary = @{@"id" : @"89A7PS064",
                                       @"images" : @{@"standard_resolution" : @{@"url" : @"http://www.sameertotey.com"}},
                                       @"user_had_liked" : @YES };
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];

    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be eqaul");
    
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:sourceDictionary[@"images"][@"standard_resolution"][@"url"]], @"The url should match");
    XCTAssertEqual(testMedia.likeState, LikeStateLiked, @"The like state should match");
}

@end
