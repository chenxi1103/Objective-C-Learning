//
//  Car.m
//  多个对象的内存管理
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Car.h"

@implementation Car
- (void) dealloc
{
    NSLog(@"时速为%d的车子报废了。",_speed);
    [super dealloc];
}

- (void) run
{
    NSLog(@"时速为%d的车子在行驶。", _speed);
}

@end
