//
//  ViewController.m
//  RPNCalculator
//
//  Created by Rosie  on 1/23/16.
//  Copyright © 2016 Rosie . All rights reserved
//

#import "ViewController.h"
#import "CalulatorModel.h"

@interface ViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) CalulatorModel *brain;

@end

@implementation ViewController
@synthesize display = _display; // property for the calulator display
@synthesize userIsInTheMiddleOfEnteringANumber = _userTab; // property for knowing if user is typing a number
@synthesize brain = _brain;

// Calculator Model getter
- (CalulatorModel *) brain {
    if (!_brain) _brain = [[CalulatorModel alloc] init];
    return _brain;
}

// DIGIT IS BEING PRESSED ACTION
- (IBAction)digitPressed:(UIButton*)sender {
    NSString *digit = [sender currentTitle]; // current title copied into local variable digit
    if (self.userIsInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit]; // my displays text is equal to the current display text with the new appended digit (utalizes a setter and getter)
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

// OPERATION IS BEING PRESSD ACTION
- (IBAction)operationPressed:(UIButton *)sender {
    
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed]; // press enter
    
    double result = [self.brain performOperation:sender.currentTitle]; // result as a double
    NSString *resultString = [NSString stringWithFormat:@"%g", result]; // result as a string
    self.display.text = resultString;
}

// ENTER BUTTON PRESSED
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]]; // send double value to push operand
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

@end
