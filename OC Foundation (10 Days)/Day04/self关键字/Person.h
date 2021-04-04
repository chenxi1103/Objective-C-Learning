//
//  Person.h
//  self关键字
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    int _age;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setAge:(int)age;
- (int)age;


- (void)sayHi;
- (void)selfSayHi;

+ (void)address;
@end
