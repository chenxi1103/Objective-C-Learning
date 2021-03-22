//
//  Gun.h
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BulletClip.h"

@interface Gun : NSObject
{
    NSString *_model;
    int _range;
    BulletClip *_bulletClip;
}

- (void) setModel:(NSString *)model;
- (NSString *)model;

- (void) setRange:(int)range;
- (int) range;

- (void) setBulletClip:(BulletClip *)bulletClip;
- (BulletClip *)bulletClip;

- (void) shoot;

@end

