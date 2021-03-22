//
//  main.m
//  依赖关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Phone *iPhone = [Phone new];
    Person *p = [Person new];
    [p callWithPhone:iPhone WithNumber:@"10086"];
    return 0;
}
