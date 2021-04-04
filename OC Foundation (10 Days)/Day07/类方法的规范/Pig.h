//
//  Pig.h
//  类方法的规范
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pig : NSObject

@property(nonatomic, retain) NSString *name;
@property(nonatomic) int age;
@property(nonatomic) float weight;

- (instancetype) initWithName: (NSString *)name andAge: (int)age andWeight: (float)weight;
+ (instancetype) pig;
+ (instancetype) pigWithName: (NSString *)name andAge: (int)age andWeight: (float)weight;

@end
