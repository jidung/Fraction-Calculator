//
//  CalculatorBrain.m
//  capstone_hw7_calculator
//
//  Created by jd on 13. 4. 30..
//  Copyright (c) 2013년 jd. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@property (nonatomic, strong) NSMutableArray *operandStack;
@property (strong, nonatomic) Fraction *operand2, *operand1;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;   //prevents operandStack being accessed directly
@synthesize operator = _operator;
@synthesize operand1 = _operand1;
@synthesize operand2 = _operand2;
@synthesize result = _result;

-(NSMutableArray *)operandStack
{
    /* if operandStack never allocated, allocate one */
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    
    /* return pointer */
    return _operandStack;
}

-(NSString *)operator
{
    if (!_operator) {
        _operator = [[NSString alloc] init];
    }
    
    /* return pointer */
    return _operator;
}

-(void) performOperation;
{

    /* method 안에서 alloc한 것도 autorelease 안되나? */
    
//    Fraction * resultFraction = [[Fraction alloc] init];

    for(Fraction * e in self.operandStack){
        
        NSLog(@"in stack : %@", [e convertToString]);
        
    }
    
    
    self.operand2 = [self popOperand];
    self.operand1 = [self popOperand];
    
    NSLog(@"operand1 is %@", [self.operand1 convertToString]);
    NSLog(@"operand2 is %@", [self.operand2 convertToString]);
    
    if ([self.operator isEqualToString:@"+"]) {
        self.result = [self.operand1 add:self.operand2];
    }
    else if ([self.operator isEqualToString:@"*"]) {
        self.result = [self.operand1 multiply:self.operand2];
    }
    else if ([self.operator isEqualToString:@"-"]) {
        self.result = [self.operand1 subtract:self.operand2];
    }
    else if ([self.operator isEqualToString:@"/"]) {
        self.result = [self.operand1 divide:self.operand2];
    }
    
    //[self pushOperand:self.result];
    
    //return self.result;
}

-(void) pushOperand:(Fraction *)operand
{
    /* always need to write "self." to get the pointer 
        from the result of operandStack @property's getter method. */
    
    NSLog(@"pushing: %@", [operand convertToString]);
    
    Fraction * pushingFraction = [[Fraction alloc] init];
    
    [pushingFraction setTo: operand.numerator over:operand.denominator];
    
    [self.operandStack addObject:pushingFraction];
}

-(Fraction *) popOperand
{
    Fraction * operandObject = [self.operandStack lastObject];
    
    if (operandObject)
        [self.operandStack removeLastObject];
    else
        NSLog(@"stack is empty!!!");
    
    return operandObject;
}

-(void) emptyStack
{
    [self.operandStack removeAllObjects];
}


@end
