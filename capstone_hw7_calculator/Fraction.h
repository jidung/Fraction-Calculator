//
//  Fraction.h
//  capstone_hw2
//
//  Created by 지민웅 on 13. 3. 20..
//  Copyright (c) 2013년 mji. All rights reserved.
//

#ifndef capstone_hw2_fraction_h
#define capstone_hw2_fraction_h

#import <Foundation/Foundation.h>
// Define the Fraction class
@interface Fraction : NSObject
@property int numerator, denominator;
-(void) print;
-(void) setTo: (int) n over: (int) d;
-(double) convertToNum;
-(NSString *) convertToString;
-(Fraction *) add: (Fraction *) f;
-(Fraction *) subtract: (Fraction *) f;
-(Fraction *) multiply: (Fraction *) f;
-(Fraction *) divide: (Fraction *) f;
-(void) reduce;
@end

#endif
