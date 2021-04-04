//
//  Person.m
//  self关键字
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}


- (void)sayHi
{
    NSString *_name = @"Default";
    NSLog(@"Hello, I am %@.", _name);
    NSLog(@"Hello, I am actually %@.", [self name]);
}

- (void)selfSayHi
{
    [self sayHi];
}


+ (void)address
{
    //应该是person类在代码段的地址
    NSLog(@"Address: %p", self);
}

@end
