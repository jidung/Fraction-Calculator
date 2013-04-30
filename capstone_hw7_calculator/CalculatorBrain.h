//
//  CalculatorBrain.h
//  capstone_hw7_calculator
//
//  Created by jd on 13. 4. 30..
//  Copyright (c) 2013년 jd. All rights reserved.
//

/**********/
/*  THIS  */
/*   IS   */
/*  MODEL */
/**********/

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface CalculatorBrain : NSObject

@property (nonatomic, strong) NSString *operator;
@property (nonatomic, strong) Fraction *result;

-(void)performOperation;
-(void)pushOperand:(Fraction *) operand;
-(Fraction *)popOperand;
-(void) emptyStack;
@end
