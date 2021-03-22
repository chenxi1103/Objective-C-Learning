//
//  Dog.h
//  关联关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    NSString *_name;
}

- (void) setName:(NSString *)name;
- (NSString *)name;

@end
