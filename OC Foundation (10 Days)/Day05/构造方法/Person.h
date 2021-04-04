//
//  Person.h
//  构造方法
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property int age;

- (instancetype) initWithName:(NSString *)name andAge:(int)age;
@end
