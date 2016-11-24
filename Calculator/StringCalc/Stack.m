//
//  Stack.m
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import "Stack.h"

@implementation Stack{
    NSMutableArray *stack;
}

-(id)init
{
    self = [super init];
    if(self!=nil){
        stack = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)pushObject:(id)obj
{
    [stack addObject:obj];
}

-(id)popObject
{
    id lastObj = [stack lastObject];
    [stack removeLastObject];
    return lastObj;
}

-(NSUInteger) stackSize
{
    return stack.count;
}

-(id) topObject
{
    return [[stack lastObject] copy];
}

-(BOOL) isEmpty
{
    return stack.count == 0;
}

-(NSString *)stackDescription
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:@"["];
    for (id s in stack) {
        [result appendFormat:@"%@, ",[s description]];
    }
    if (stack.count>0) {
        result = [[result stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@", "]] mutableCopy];
    }
    [result appendString:@"]"];
    return result;
}


@end
