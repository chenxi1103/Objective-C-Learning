//
//  main.m
//  循环retain
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    //person和book我用着你你用着我，谁也不肯release所以两个对象就都无法release造成内存泄漏。
    //这种情况一边用retain一边用assign就可以了。
    Person *p = [Person new];
    Book *b = [Book new];
    
    p.book = b;
    b.owner = p;
    
    [b release];
    [p release];
    return 0;
}
