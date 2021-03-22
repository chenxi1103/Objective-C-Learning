//
//  Person.m
//  依赖关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void) callWithPhone:(Phone *)phone WithNumber:(NSString *)number
{
    [phone callWithNumber:number];
}
@end
