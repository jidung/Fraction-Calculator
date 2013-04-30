//
//  CalculateViewController.h
//  capstone_hw7_calculator
//
//  Created by jd on 13. 4. 30..
//  Copyright (c) 2013년 jd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
/* since this windows already has a strong pointer to this object, weak is a good choice here. */
@property (weak, nonatomic) IBOutlet UILabel *display;
@end
