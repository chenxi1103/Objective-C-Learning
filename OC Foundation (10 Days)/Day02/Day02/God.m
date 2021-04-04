//
//  God.m
//  Day02
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "God.h"

@implementation God

- (void) killWithPerson:(Person *)p
{
    p->_leftLife = 0;
    NSLog(@"%@ died...", p->_name);
}

- (Person *) makePersonWithName: (NSString *)name andGender:(Gender)gender andLeftLife:(int) leftLife
{
    Person *p = [Person new];
    p->_name = name;
    p->_gender = gender;
    p->_age = 0;
    p->_leftLife = leftLife;
    return p;
}

@end
