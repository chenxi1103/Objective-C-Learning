//
//  Person.h
//  依赖关系
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

@interface Person : NSObject

- (void) callWithPhone:(Phone *)phone WithNumber:(NSString *)number;
@end
