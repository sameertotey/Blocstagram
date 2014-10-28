//
//  ComposeCommentViewTests.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/28/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface ComposeCommentViewTests : XCTestCase

@end

@implementation ComposeCommentViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatIsWritingCommentSetToYes {
    ComposeCommentView *ccView = [[ComposeCommentView alloc] initWithFrame:CGRectMake(0,0, 0, 0)];  // make a comment view with dummy frame
    
    ccView.text = @"Non Empty Text";
    XCTAssert(ccView.isWritingComment, @"Non Empty text should set the isWriting Property");
}

- (void)testThatIsWritingCommentSetToNo {
    ComposeCommentView *ccView = [[ComposeCommentView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    ccView.text = @"";    // Empty text
    XCTAssert(!ccView.isWritingComment, @"Empty text should not set the isWriting Property");
    
}

@end
