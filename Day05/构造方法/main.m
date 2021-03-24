//
//  main.m
//  构造方法
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Dog *g = [[Dog alloc] initWithName:@"Bacon" andAge:1];
    NSLog(@"Dog %@ is %d years old.", g.name, g.age);
    [g shout];
    return 0;
}
