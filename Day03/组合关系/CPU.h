//
//  CPU.h
//  Day03
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPU : NSObject
{
    NSString *_brand;
    NSString *_model;
    int _speed;
}

- (void) calculate;

- (void) setBrand: (NSString *)brand;
- (NSString *) brand;

- (void) setModel: (NSString *)model;
- (NSString *) model;

- (void) setSpeed: (int)speed;
- (int) speed;

@end
