//
//  StringCalc.h
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

typedef NS_ENUM(NSInteger, NSCharacterType) {
    kDelim,
    kDigit,
    kOperation,
    kUnaryOperation
};


@interface StringCalc : NSObject

+(NSString*) calculateExpression:(NSString*)expression;

@end
