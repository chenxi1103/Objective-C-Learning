//
//  main.m
//  继承
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    Student *s = [Student new];
    [s setName:@"Lexi"];
    [s setAge:18];
    [s setSchool:@"CMU"];
    
    [s study];
    return 0;
}
