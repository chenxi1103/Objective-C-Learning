//
//  CPU.m
//  Day03
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "CPU.h"

@implementation CPU
- (void) calculate
{
    NSLog(@"Calculating...");
}

- (void) setBrand: (NSString *)brand
{
    _brand = brand;
}
- (NSString *) brand
{
    return _brand;
}

- (void) setModel: (NSString *)model
{
    _model = model;
}
- (NSString *) model
{
    return _model;
}

- (void) setSpeed: (int)speed
{
    _speed = speed;
}
- (int) speed
{
    return _speed;
}

@end
