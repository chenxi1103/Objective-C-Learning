//
//  Person.h
//  Day02
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gender.h"

@interface Person : NSObject
{
    @public
    NSString *_name;
    int _age;
    Gender _gender;
    int _leftLife;
}

- (void) show;

@end

