

#import "Fraction.h"
@implementation Fraction
@synthesize numerator, denominator;
-(void) print
{
    if (numerator >= 0 && denominator < 0)
        NSLog (@"%i/%i", -numerator, -denominator);
    else
        NSLog (@"%i/%i", numerator, denominator);
}
-(double) convertToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}
-(NSString *) convertToString
{
    if(numerator == denominator)
        if(numerator == 0)  return @"0";
        else                return @"1";
    else if (denominator == 1)
        return [NSString stringWithFormat:@"%i", numerator];
    else
        return [NSString stringWithFormat:@"%i/%i", numerator, denominator];
}
-(void) setTo: (int) n over: (int) d
{
    numerator = n;
    denominator = d;
}

// add a Fraction to the receiver
-(Fraction *) add: (Fraction *) f
{
    // To add two fractions:
    // a/b + c/d = ((a*d) + (b*c)) / (b * d)
    
    //result will store the result of addition.
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;

    [result reduce];
    return result;
}

-(Fraction *) subtract: (Fraction *) f
{
    // To subtract two fractions:
    // a/b - c/d = ((a*d) - (b*c) / (b * d)
    
    //result will store the result of addition.
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *) multiply: (Fraction *) f
{
    // To multiply two fractions:
    // a/b * c/d = (a*c) / (b * d)
    
    //result will store the result of addition.
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *) divide:(Fraction *)f
{
    // To devide two fractions:
    // (a/b) / (c/d) = (a*c) / (b * d)
    
    //result will store the result of addition.
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    
    [result reduce];
    return result;
}

-(void) reduce
{
    int u = numerator;
    int v = denominator;
    int temp;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v=temp;
    }
    numerator /= u;
    denominator /= u;
}
@end