//
//  Car.h
//  arc机制下多个对象内存管理
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property(nonatomic) NSString *brand;
@property(nonatomic) int speed;

- (void) run;
@end
