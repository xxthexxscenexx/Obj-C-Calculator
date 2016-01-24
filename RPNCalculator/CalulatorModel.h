//
//  CalulatorModel.h
//  RPNCalculator
//
//  Created by Rosie  on 1/23/16.
//  Copyright © 2016 Rosie . All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CalulatorModel : NSObject

-(void) pushOperand: (double)operand;
-(double) performOperation: (NSString *)operation;

@end