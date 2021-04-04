//
//  Person.m
//  arc机制下多个对象内存管理
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void) drive
{
    NSLog(@"%@ is driving %@", _name, _car.brand);
    [_car run];
}
@end
