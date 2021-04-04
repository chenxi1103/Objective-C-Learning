//
//  Computer.m
//  Day03
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//
#import "Computer.h"

@implementation Computer
- (void) setCpu: (CPU *)cpu
{
    _cpu = cpu;
}
- (CPU *) cpu
{
    return _cpu;
}
@end
