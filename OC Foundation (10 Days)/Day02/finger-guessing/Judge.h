//
//  Judge.h
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Robot.h"

@interface Judge : NSObject
{
    @public
    NSString *_name;
    
}

- (void) judgeResultWithPlayer:(Player *)p andRobot:(Robot *)r;
@end

