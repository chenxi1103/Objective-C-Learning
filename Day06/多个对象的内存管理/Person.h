//
//  Person.h
//  多个对象的内存管理
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface Person : NSObject
{
    Car *_car;
}

-(void)setCar:(Car *)car;
-(Car *)car;
- (void) drive;
@end
