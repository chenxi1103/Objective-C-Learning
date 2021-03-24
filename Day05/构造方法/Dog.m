//
//  Dog.m
//  构造方法
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (void)shout
{
    NSLog(@"WHOF!");
}
- (instancetype)initWithName:(NSString *)name andAge:(int)age
{
    if(self = [super init])
    {
        self.name = name;
        self.age = age;
    }
    return self;
}
@end
