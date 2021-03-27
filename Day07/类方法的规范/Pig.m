//
//  Pig.m
//  类方法的规范
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Pig.h"

@implementation Pig

- (void) dealloc
{
    [_name release];
    [super dealloc];
}

- (instancetype) initWithName: (NSString *)name andAge: (int)age andWeight: (float)weight
{
    if (self = [super init])
    {
        self.name = name;
        self.age = age;
        self.weight = weight;
    }
    return self;
}
+ (instancetype) pig
{
    return [[self alloc] init];
}
+ (instancetype) pigWithName: (NSString *)name andAge: (int)age andWeight: (float)weight
{
    return [[self alloc] initWithName:name andAge:age andWeight:weight];
}

@end
