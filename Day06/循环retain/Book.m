//
//  Book.m
//  循环retain
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Book.h"
#import "Person.h"

@implementation Book
- (void) dealloc
{
    NSLog(@"Book %@ is broken. %@ can't read it anymore.", _name, _owner.name);
    [_name release];
    [_owner release];
    [super dealloc];
}

- (void) castKnowledge
{
    NSLog(@"Knowledge is power!");
}
@end
