//
//  Stack.h
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

-(void) pushObject:(id)obj;
-(id) popObject;
-(NSUInteger) stackSize;
-(id) topObject;
-(BOOL) isEmpty;

@end
