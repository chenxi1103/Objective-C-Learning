//
//  MyArray.h
//  block
//
//  Created by Li, Chenxi on 3/27/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyArray : NSObject
- (void) sortWithCountries:(char *[])countries andLength:(int)len;
- (void) sortWithCountries:(char *[])countries andLength:(int)len andCompareBlock:(BOOL (^)(char *country1, char *country2))compareBlock;
@end
