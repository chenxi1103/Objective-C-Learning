//
//  Dog.h
//  构造方法
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property NSString *name;
@property int age;

- (void)shout;
- (instancetype)initWithName:(NSString *)name andAge:(int)age;

@end
