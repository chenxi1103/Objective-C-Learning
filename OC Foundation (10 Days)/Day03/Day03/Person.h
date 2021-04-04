//
//  Person.h
//  Day03
//
//  Created by Li, Chenxi on 3/20/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject
{
    NSString *_name;
    int _age;
}

- (void) sayHi;

- (void) setName: (NSString *)name;
- (NSString *) name;

- (void) setAge: (int) age;
- (int) age;
@end
