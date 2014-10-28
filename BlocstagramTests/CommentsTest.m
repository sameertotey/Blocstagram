//
//  CommentsTest.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/27/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Comment.h"

@interface CommentsTest : XCTestCase

@end

@implementation CommentsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitilaizationWorks {
    NSDictionary *sourceDictionary = @{@"id" : @"8675309",
                                       @"text" : @"Sample Comment"};
    
    Comment *testComment = [[Comment alloc]initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testComment.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testComment.text, sourceDictionary[@"text"], @"The text should be equal");
}

@end
