//
//  Player.m
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void) showFist
{
    NSLog(@"Dear player: %@. Please select your choices: 1. Scissors, 2. Stone, 3. Paper.", _name);
    int userSelect = 0;
    scanf("%d", &userSelect);
    NSString *fistTypeWithNumber = [self fistTypeWithHumber:userSelect];
    NSLog(@"Player [%@] chose to select %@", _name, fistTypeWithNumber);
    _selectedType = userSelect;
}

- (NSString *) fistTypeWithHumber: (int)number
{
    switch (number) {
        case 1:
            return @"Scissors";
        case 2:
            return @"Stone";
        default:
            return @"Paper";
    }
}
@end
