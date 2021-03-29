//
//  main.m
//  protocol
//
//  Created by Li, Chenxi on 3/28/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Dog *dog = [Dog new];
    [dog run];
    [dog sleep];
    return 0;
}
