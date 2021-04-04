//
//  Person.h
//  循环retain
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject

@property(nonatomic,retain) NSString *name;
@property(nonatomic,assign) Book *book;

- (void) read;

@end
