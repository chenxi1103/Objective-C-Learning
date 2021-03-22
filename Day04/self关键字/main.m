//
//  main.m
//  self关键字
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    [p setName:@"Lexi"];
    [p sayHi];
    [p selfSayHi];
    
    [Person address];
    NSLog(@"%p", [Person class]);
    
    return 0;
}
