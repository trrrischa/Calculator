//
//  Stack_Test.m
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Stack.h"

@interface Stack_Test : XCTestCase{
    Stack* _stack;
}


@end

@implementation Stack_Test

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _stack = [[Stack alloc] init];
    XCTAssertNotNil(_stack, @"Construct error!");
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStack
{
    NSString* st1 = [NSString stringWithFormat:@"string1"];
    NSString* st2 = [NSString stringWithFormat:@"string2"];
    [_stack pushObject:st1];
    XCTAssertEqual(st1,[_stack topObject], @"Top is not working proper");
    XCTAssertEqual(1,[_stack stackSize], @"StackSize is not working proper");

    [_stack pushObject:st2];
    XCTAssertEqual(st2,[_stack topObject], @"Top is not working proper");
    XCTAssertEqual(2,[_stack stackSize], @"StackSize is not working proper");

    XCTAssertEqual(st2,[_stack popObject], @"Pop is not working proper");
    XCTAssertEqual(1,[_stack stackSize], @"StackSize is not working proper");

    XCTAssertEqual(st1,[_stack popObject], @"Pop is not working proper");
    XCTAssertEqual(0,[_stack stackSize], @"StackSize is not working proper");

    XCTAssertTrue([_stack isEmpty], @"Not empty stack after all objects are popped");
    
}


@end
