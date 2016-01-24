//
//  ViewController.m
//  RPNCalculator
//
//  Created by Rosie  on 1/23/16.
//  Copyright © 2016 Rosie . All rights reserved
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize display = _display; // property for the calulator display

- (IBAction)digitPressed:(UIButton*)sender {
    NSString *digit = [sender currentTitle]; // current title copied into local variable digit
    NSLog(@"Digit Pressed = %@", digit);
    self.display.text = [self.display.text stringByAppendingString:digit]; // my displays text is equal to the current display text with the new appended digit (utalizes a setter and getter)
}

@end
