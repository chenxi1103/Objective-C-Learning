//
//  Student.m
//  继承
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void) setSchool:(NSString *)school
{
    _school = school;
}
- (NSString *)school
{
    return _school;
}
- (void) study
{
    NSLog(@"%@ is studying at %@", [super name], [self school]);
}
@end
