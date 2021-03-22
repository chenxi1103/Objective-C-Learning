//
//  BulletClip.m
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "BulletClip.h"

@implementation BulletClip
- (void) setMaxCapacity:(int)maxCapacity
{
    _maxCapacity = maxCapacity;
}
- (int) maxCapacity
{
    return _maxCapacity;
}

- (void) setBulletCount:(int)bulletCount
{
    _bulletCount = bulletCount;
}
- (int) bulletCount
{
    return _bulletCount;
}

@end
