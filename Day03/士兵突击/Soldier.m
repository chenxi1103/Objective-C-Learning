//
//  Soldier.m
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Soldier.h"

@implementation Soldier
- (void) setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

- (void) setType:(NSString *)type
{
    _type = type;
}
- (NSString *)type
{
    return _type;
}

- (void) setGun:(Gun *)gun
{
    _gun = gun;
}
- (Gun *)gun
{
    return _gun;
}

- (void) fire
{
    [_gun shoot];
}

@end
