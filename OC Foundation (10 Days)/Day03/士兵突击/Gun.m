//
//  Gun.m
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Gun.h"

@implementation Gun
- (void) setModel:(NSString *)model
{
    _model = model;
}
- (NSString *)model
{
    return _model;
}

- (void) setRange:(int)range
{
    _range = range;
}
- (int) range
{
    return _range;
}

- (void) setBulletClip:(BulletClip *)bulletClip
{
    _bulletClip = bulletClip;
}
- (BulletClip *)bulletClip
{
    return _bulletClip;
}

- (void) shoot
{
    int curBulletCount = [_bulletClip bulletCount];
    if (curBulletCount > 0)
    {
        NSLog(@"Boom!");
        [_bulletClip setBulletCount:curBulletCount-1];
    }
    else
    {
        NSLog(@"Reload!");
        [_bulletClip setBulletCount:[_bulletClip maxCapacity]];
        NSLog(@"Boom!");
        [_bulletClip setBulletCount:[_bulletClip bulletCount]-1];
    }
}

@end
