//
//  main.m
//  MRC
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    p.name = @"Lexi";
    NSLog(@"count = %lu", p.retainCount);
    [p retain];
    NSLog(@"count = %lu", p.retainCount);
    [p release];
    NSLog(@"count = %lu", p.retainCount);
    [p release]; //此时p对象被回收，指向p这个对象的指针*p变成了野指针
    p.age = 25;
    [p sayHi]; //即使p对象被回收了，但也只是代表p对象申请的空间可以分配给别人了，但p对象的数据还在原位置没有动，所以我们依旧可以访问p对象的数据，调用p的对象方法。这个对象就叫做僵尸对象。
    return 0;
}
