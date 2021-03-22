//
//  Person.m
//  关联关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void) setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

- (void) setDog:(Dog *)dog
{
    _dog = dog;
}
- (Dog *) dog
{
    return _dog;
}
@end
