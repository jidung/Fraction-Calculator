//
//  CalculateViewController.m
//  capstone_hw7_calculator
//
//  Created by jd on 13. 4. 30..
//  Copyright (c) 2013년 jd. All rights reserved.
//

/***********/
/*  THIS   */
/*   IS    */
/*  CNTRLR */
/***********/


#import "CalculatorViewController.h"
#import "CalculatorBrain.h"


@interface CalculatorViewController ()
@property (nonatomic) BOOL isUserInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL isOverPressed;
@property (nonatomic) BOOL hadOver;
@property (strong, nonatomic) NSString *displayToken;
@property (strong, nonatomic) CalculatorBrain *brain;   //a pointer that points the Model
@property (strong, nonatomic) Fraction *fraction;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize isUserInTheMiddleOfEnteringANumber = _isUserInTheMiddleOfEnteringANumber;
@synthesize isOverPressed = _isOverPressed;
@synthesize brain = _brain;
@synthesize fraction = _fraction;

- (Fraction *) fraction
{
    /* lazy instantiation */
    if(!_fraction) _fraction = [[Fraction alloc] init];
    return _fraction;
}

- (CalculatorBrain *) brain
{
    /* lazy instantiation */
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}


/* UIButton object will be passed to
    here as 'sender' from the view
    when an event occurs. */

- (IBAction) digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];

    /* %@ means "send the message 'description' to the object and
     use the results as the string to print."
     NSString return itself from its description method.
     All objects in iOS responds to the message 'description'
     because NSObject implements it. */
    //NSLog(@"user touched %@", digit);
    
    if ( self.isUserInTheMiddleOfEnteringANumber ) {
        
        if (self.isOverPressed){
            [self.fraction setDenominator:[digit intValue]];
            [self.brain pushOperand:self.fraction];
            self.isOverPressed = NO;
        }
        else{
            [self.fraction setNumerator:[digit intValue]];
        }

        self.display.text = [self.display.text stringByAppendingString:digit];
            
    }
    else {
        
        self.display.text = digit;
        [self.fraction setNumerator:[digit intValue]];
        self.isUserInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)overPressed
{
    if ( self.isUserInTheMiddleOfEnteringANumber ) {
        self.display.text = [self.display.text stringByAppendingString:@"/"];
    }
    else {
        NSLog(@"error : a digit should be pressed first");
    }
    self.isOverPressed = YES;
    NSLog(@"isOverPressed : %i", self.isOverPressed);
}
- (IBAction)equalPressed
{
    
    [self.brain performOperation];
    NSLog(@"result : %@", [self.brain.result convertToString]);
    
    if ( self.isUserInTheMiddleOfEnteringANumber )  {
        self.display.text = [self.display.text stringByAppendingString:@"="];
        self.display.text = [self.display.text
                             stringByAppendingString:[self.brain.result convertToString]];
    }
    else {
        NSLog(@"error : fractions and an operator should be pressed first");
    }

}
- (IBAction)operationPressed:(UIButton *)sender
{
    NSString *operator = [sender currentTitle];
    if ( self.isUserInTheMiddleOfEnteringANumber ) {
        self.brain.operator = operator;
        self.display.text = [self.display.text stringByAppendingString:operator];
    }
    else {
        NSLog(@"error : a fraction should be pressed first");
    }
}

- (IBAction)clearPressed{
    
    self.display.text = @"0";
    self.isUserInTheMiddleOfEnteringANumber = NO;
    self.isOverPressed = NO;
    
    NSLog(@"ok till here");
    
    [self.brain emptyStack];
    
}


@end
