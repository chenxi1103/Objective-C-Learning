//
//  Person.m
//  循环retain
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void) dealloc
{
    NSLog(@"%@ died. Book: %@ haven't been read!", _name, _book.name);
    [_name release];
//    [_book release];
    [super dealloc];
}

- (void) read
{
    NSLog(@"Reading %@", _book.name);
}

@end
