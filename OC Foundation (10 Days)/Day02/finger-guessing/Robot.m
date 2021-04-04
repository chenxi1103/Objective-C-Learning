//
//  Robot.m
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Robot.h"
#import "stdlib.h"

@implementation Robot
- (void) showFist
{
    int robotSelect = arc4random_uniform(3) + 1;
    NSLog(@"Robot [%@] chose to select: %@", _name, [self fistTypeWithHumber:robotSelect]);
    _selectType = robotSelect;
}2
- (NSString *) fistTypeWithHumber: (int)number
{
    switch (number) {
        case 1:
            return @"Scissors";
        case 2:
            return @"Stone";
        default:
            return @"Paper";
    }
}
@end
