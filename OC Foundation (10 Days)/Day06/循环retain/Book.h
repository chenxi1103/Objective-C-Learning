//
//  Book.h
//  循环retain
//
//  Created by Li, Chenxi on 3/24/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface Book : NSObject

@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) Person *owner;

- (void) castKnowledge;
@end
