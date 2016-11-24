//
//  StringCalc.m
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import "StringCalc.h"

@interface StringCalc ()

+(NSCharacterType) typeOfSymbol:(char)c;
+(int) operationPriority:(char)op;
+(BOOL) performOperation:(char)op withStack:(Stack*)stack;

@end

@implementation StringCalc
#pragma mark Calc Function

+(NSString*) calculateExpression:(NSString*)expression
{
    BOOL unaryOperand = true;
    BOOL openBracket = false;
    Stack* operandStack = [[Stack alloc] init];
    Stack* operationStack = [[Stack alloc] init];
    for (size_t i=0; i<expression.length; ++i)
        if ( !([self typeOfSymbol:[expression characterAtIndex:i]] == kDelim) )
        {
            if ([expression characterAtIndex:i] == '(')
            {
                [operationStack pushObject:[NSString stringWithFormat:@"%c",'(']];
                unaryOperand = true;
                openBracket = true;
            }
            else if ( [expression characterAtIndex:i] == ')' )
            {
                if (!openBracket)
                {
                    return @"Некорректное выражение!";
                }
                while ( !([[operationStack topObject] isEqualToString:@"("]) )
                    if (![self performOperation:[[operationStack popObject] characterAtIndex:0] withStack:operandStack])
                        return @"На ноль делить нельзя!";
                [operationStack popObject];
                unaryOperand = false;
                openBracket = false;
            }
            else if ( ([self typeOfSymbol:[expression characterAtIndex:i]] == kUnaryOperation)
                     || ([self typeOfSymbol:[expression characterAtIndex:i]] == kOperation) )
            {
                char curop = [expression characterAtIndex:i];
                if (unaryOperand && ([self typeOfSymbol:curop] == kUnaryOperation))
                    curop = -curop;
                while (![operationStack isEmpty] && [self operationPriority:[[operationStack topObject] characterAtIndex:0]] >= [self operationPriority:curop])
                    if (![self performOperation:[[operationStack popObject] characterAtIndex:0] withStack:operandStack])
                        return @"На ноль делить нельзя!";
                [operationStack pushObject:[NSString stringWithFormat:@"%c",curop]];
                unaryOperand = true;
            }
            else
            {
                if ( !([self typeOfSymbol:[expression characterAtIndex:i]] == kDigit) ) {
                    return @"Некорректное выражение!";
                }
                NSString *operand = [NSString stringWithFormat:@""];
                while ((i < expression.length) && ([self typeOfSymbol:[expression characterAtIndex:i]] == kDigit || [expression characterAtIndex:i] == '.'))
                    operand = [operand stringByAppendingFormat:@"%c",[expression characterAtIndex:i++]];
                --i;
                [operandStack pushObject:operand];
                unaryOperand = false;
            }
        }
    while (![operationStack isEmpty])
        if (![self performOperation:[[operationStack popObject] characterAtIndex:0] withStack:operandStack])
            return @"На ноль делить нельзя!";
    return [operandStack topObject];
}

#pragma mark Auxiliary Functions

+(NSCharacterType) typeOfSymbol:(char)c
{
    switch (c) {
        case ' ':
            return kDelim;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            return kDigit;
        case '+':
        case '-':
            return kUnaryOperation;
        case '*':
        case '/':
            return kOperation;
        default:
            return kUnknownType;
    }
}

+(int) operationPriority:(char) op
{
    if (op < 0)
        return 4; // op == -'+' || op == -'-'
    return
    op == '+' || op == '-' ? 1 :
    op == '*' || op == '/' ? 2 :
    -1;
}

+(BOOL) performOperation:(char)op withStack:(Stack*)stack
{
    if (op < 0)
    {
        float l = [[stack popObject] floatValue];;
        switch (-op) {
            case '+':  [stack pushObject:[NSString stringWithFormat:@"%0.2f",l]];  break;
            case '-':  [stack pushObject:[NSString stringWithFormat:@"%0.2f",-l]];  break;
        }
    }
    else {
        float r = [[stack popObject] floatValue];
        float l = [[stack popObject] floatValue];
        if ((r == 0) && (op == '/'))
            return FALSE;
        
        switch (op) {
            case '+':  [stack pushObject:[NSString stringWithFormat:@"%0.2f",l + r]];  break;
            case '-':  [stack pushObject:[NSString stringWithFormat:@"%0.2f",l - r]];  break;
            case '*':  [stack pushObject:[NSString stringWithFormat:@"%0.2f",l * r]];  break;
            case '/':  [stack pushObject:[NSString stringWithFormat:@"%0.2f",l / r]];  break;
        }
    }
    return TRUE;
}


@end
