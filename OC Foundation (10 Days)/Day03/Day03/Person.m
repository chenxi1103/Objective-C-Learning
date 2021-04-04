//
//  Person.m
//  Day03
//
//  Created by Li, Chenxi on 3/20/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void) sayHi
{
    NSLog(@"Hi, this is %@", _name);
}

- (void) setName: (NSString *)name
{
    _name = name;
}

- (NSString *) name
{
    return _name;
}

- (void) setAge: (int) age
{
    if (age >= 0 && age <= 200)
    {
        _age = age;
    }
    else
    {
        _age = 18;
    }
}

- (int) age
{
    return _age;
}

@end
