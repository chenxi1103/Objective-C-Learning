//
//  Judge.m
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Judge.h"

@implementation Judge
- (void) judgeResultWithPlayer:(Player *)p andRobot:(Robot *)r
{
    int playerSelect = p->_selectedType;
    int robotSelect = r->_selectType;
    if (playerSelect == robotSelect)
    {
        NSLog(@"Draw!!!");
    }
    else if (playerSelect - robotSelect == -2 || playerSelect - robotSelect == 1)
    {
        NSLog(@"Player [%@] win!", p->_name);
        p->_score++;
    }
    else
    {
        NSLog(@"Robot [%@] win!", r->_name);
        r->_score++;
    }
    NSLog(@"--------- Player:[%@]:[%d] ------------ Robot:[%@]:[%d] ----------", p->_name, p->_score, r->_name, r->_score);
}
@end
