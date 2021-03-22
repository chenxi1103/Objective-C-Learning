//
//  BulletClip.h
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BulletClip : NSObject
{
    int _maxCapacity;
    int _bulletCount;
}

- (void) setMaxCapacity:(int)maxCapacity;
- (int) maxCapacity;

- (void) setBulletCount:(int)bulletCount;
- (int) bulletCount;
@end
