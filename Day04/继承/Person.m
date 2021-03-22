//
//  Person.m
//  继承
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

- (void)introduce
{
    NSLog(@"This is %@. I am %d years old.", _name, _age);
}
@end
