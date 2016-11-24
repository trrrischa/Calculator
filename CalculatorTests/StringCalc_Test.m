//
//  StringCalc_Test.m
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StringCalc.h"

@interface StringCalc_Test : XCTestCase

@end

@implementation StringCalc_Test

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCalc
{
    
    XCTAssertEqualObjects(@"5.00", [StringCalc calculateExpression:@"2+3"], @"'2+3' must be equal to '5'");
    XCTAssertEqualObjects(@"-1.00", [StringCalc calculateExpression:@"2-3"], @"'2-3' must be equal to '-1'");
    XCTAssertEqualObjects(@"6.00", [StringCalc calculateExpression:@"2*3"], @"'2*3' must be equal to '6'");
    XCTAssertEqualObjects(@"0.67", [StringCalc calculateExpression:@"2/3"], @"'2/3' must be equal to '0.67'");
    
    
}

@end
