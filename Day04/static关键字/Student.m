//
//  Student.m
//  static关键字
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Student.h"

@implementation Student
- (int)number
{
    return _number;
}

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

- (instancetype)student
{
    return [Student new];
}
- (instancetype)studnetWithName:(NSString *)name AndAge:(int)age
{
    //这个number变量从第一次被调用后就不会消失，下次调用这个方法时自动+1；
    static int number = 1;
    Student *s = [Student new];
    [s setName:name];
    [s setAge:age];
    s->_number = number;
    number++;
    return s;
}

@end
