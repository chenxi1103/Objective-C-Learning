//
//  Student.h
//  static关键字
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Student : NSObject
{
    int _number;
    NSString *_name;
    int _age;
}

- (int)number;

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setAge:(int)age;
- (int)age;

- (instancetype)student;
- (instancetype)studnetWithName:(NSString *)name AndAge:(int)age;
@end
