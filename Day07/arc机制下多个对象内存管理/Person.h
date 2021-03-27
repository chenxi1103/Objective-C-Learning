//
//  Person.h
//  arc机制下多个对象内存管理
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface Person : NSObject

@property(nonatomic) Car *car;
@property(nonatomic) NSString *name;

- (void) drive;
@end
