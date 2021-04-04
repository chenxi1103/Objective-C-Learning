//
//  main.m
//  类方法的规范
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pig.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Pig *p1 = [[Pig alloc] initWithName:@"p1" andAge:2 andWeight:260];
        //prefer this one.
        Pig *p2 = [Pig pigWithName:@"p2" andAge:2 andWeight:300];
    }
    return 0;
}
