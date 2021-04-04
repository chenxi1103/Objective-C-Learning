//
//  Robot.h
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FistType.h"

@interface Robot : NSObject
{
    @public
    NSString *_name;
    int _score;
    FistType _selectType;
}
- (void) showFist;
- (NSString *) fistTypeWithHumber: (int)number;
@end
