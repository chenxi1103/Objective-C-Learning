//
//  Phone.h
//  依赖关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
{
    NSString *_brand;
    int _price;
}
- (void) setBrand:(NSString *)brand;
- (NSString *) brand;

- (void) setPrice:(int)price;
- (int) price;

- (void) callWithNumber:(NSString *)number;
@end
