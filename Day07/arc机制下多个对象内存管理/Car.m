//
//  Car.m
//  arc机制下多个对象内存管理
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void) dealloc
{
    NSLog(@"%@ is broken already", _brand);
}

- (void) run
{
    NSLog(@"%@ is running at %d speed", _brand, _speed);
}
@end
