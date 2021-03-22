//
//  Person.h
//  关联关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject
{
    NSString *_name;
    Dog *_dog;
}
- (void) setName:(NSString *)name;
- (NSString *)name;

- (void) setDog:(Dog *)dog;
- (Dog *) dog;
@end
