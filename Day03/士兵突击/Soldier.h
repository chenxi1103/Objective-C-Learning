//
//  Soldier.h
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

@interface Soldier : NSObject
{
    NSString *_name;
    NSString *_type;
    Gun *_gun;
}

- (void) setName:(NSString *)name;
- (NSString *)name;

- (void) setType:(NSString *)type;
- (NSString *)type;

- (void) setGun:(Gun *)gun;
- (Gun *)gun;

- (void) fire;
@end
