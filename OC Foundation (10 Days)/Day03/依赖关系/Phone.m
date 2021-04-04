//
//  Phone.m
//  依赖关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Phone.h"

@implementation Phone
- (void) setBrand:(NSString *)brand
{
    _brand = brand;
}
- (NSString *)brand
{
    return _brand;
}

- (void) setPrice:(int)price
{
    _price = price;
}
- (int)price
{
    return _price;
}

- (void) callWithNumber:(NSString *)number
{
    NSLog(@"Calling: %@", number);
}
@end
