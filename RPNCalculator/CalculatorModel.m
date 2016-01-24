//
//  CalculatorModel.m
//  RPNCalculator
//
//  Created by Rosie  on 1/23/16.
//  Copyright © 2016 Rosie . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalulatorModel.h"

// PRIVATE INTERFACE
@interface CalulatorModel()
@property (nonatomic, strong) NSMutableArray *operandStack; // Operand stack
@end

@implementation CalulatorModel

@synthesize operandStack = _operandStack;

// Getter for operand stack
-(NSMutableArray *) operandStack{
    if ((_operandStack = nil)) _operandStack = [[NSMutableArray alloc] init]; // if nill then allocate it
    return _operandStack;
}

// Push operand to the stack
-(void) pushOperand: (double)operand{
    [self.operandStack addObject: [NSNumber numberWithDouble:operand]]; // Add NSNumber object to the array
    NSLog(@"Operands on stack: %f", operand);
    NSLog(@"Array: %@", _operandStack); // FOUND ISSUE: everything is operating correctly except the array is not actually being filled, therefore it returns null when operands are pulled resulting in a value of zero at all times 
}

-(double) popOperand {
    NSNumber *operandObject = [self.operandStack lastObject]; // Looks for last object
    if (operandObject) [self.operandStack removeLastObject];  // Removes last object from the array
    NSLog(@"Operand Pulled From Stack: %@", operandObject);
    return [operandObject doubleValue]; // Returns the double value of the last object
}

// Perform a given operation
-(double) performOperation: (NSString *)operation{
    // calculate results
    double result;
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]){
        result = [self popOperand] * [self popOperand];
    }
    [self pushOperand:result]; 
    
    NSLog(@"%f", result);
    return result;
}

@end
