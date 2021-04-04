//
//  Player.h
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FistType.h"

@interface Player : NSObject
{
    @public
    NSString *_name;
    int _score;
    FistType _selectedType;
}

- (void) showFist;
- (NSString *) fistTypeWithHumber: (int)number;

@end
