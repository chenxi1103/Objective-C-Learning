//
//  Person.m
//  MRC
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)sayHi
{
    NSLog(@"Hi! My name is %@. I am %d years old.", self.name, self.age);
}

- (void)dealloc //只要这个方法被执行，就代表这个对象被回收了。
{
    NSLog(@"%@ is died...", self.name);
    [super dealloc];
}
@end
