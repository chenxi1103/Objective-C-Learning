//
//  Person.m
//  多个对象的内存管理
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void) dealloc
{
    NSLog(@"人死掉了。。。");
    //因为人死掉了，所以意味着少一个人使用他所拥有的车了,所以要为这个车发送release消息。
    [_car release];
    [super dealloc];
}

- (void) drive
{
    NSLog(@"开车");
    [_car run];
}

-(void)setCar:(Car *)car
{
    //将传入的车对象赋值意味着这个car多了一个人在用，所以首先要为这个对象发送一个retain消息。
    if (_car != car) //说明新旧对象不是一个对象
    {
        [_car release];
        [car retain];
    }
    _car = car;
}
-(Car *)car
{
    return _car;
}
@end
