//
//  main.m
//  关联关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    [p setName:@"JX"];
    Dog *d = [Dog new];
    [d setName:@"Coco"];
    
    NSLog(@"%@ has dog, whose name is %@.", [p name], [d name]);
    
    return 0;
}
