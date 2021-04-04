//
//  Student.h
//  继承
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    NSString *_school;
}

- (void) setSchool:(NSString *)school;
- (NSString *)school;

- (void) study;
@end
