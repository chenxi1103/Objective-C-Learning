//
//  God.h
//  Day02
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gender.h"
#import "Person.h"

@interface God : NSObject
{
    @public
    NSString *_name;
    int _age;
    Gender _gender;
}

- (void) killWithPerson: (Person *) p;
- (Person *) makePersonWithName:(NSString *)name andGender:(Gender)gender andLeftLife:(int) leftLife;

@end

