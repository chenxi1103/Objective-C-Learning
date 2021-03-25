//
//  main.m
//  多个对象的内存管理
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    Car *bmw = [Car new];
    bmw.speed = 100;
    
    Car *benz = [Car new];
    benz.speed = 180;
    
    p.car = bmw;
    [p drive];
    
    p.car = benz;
    [p drive];
    
    [p release];
    [bmw release];
    [benz release];
    return 0;
}
