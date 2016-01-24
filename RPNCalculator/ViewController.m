//
//  ViewController.m
//  RPNCalculator
//
//  Created by Rosie  on 1/23/16.
//  Copyright © 2016 Rosie . All rights reserved
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;

@end

@implementation ViewController
@synthesize display = _display; // property for the calulator display
@synthesize userIsInTheMiddleOfEnteringANumber = _userTab; // property for knowing if user is typing a number

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
- (IBAction)operationPressed:(id)sender {
}

// ENTER BUTTON PRESSED
- (IBAction)enterPressed {
}

@end
