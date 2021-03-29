//
//  MyArray.m
//  block
//
//  Created by Li, Chenxi on 3/27/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "MyArray.h"
#import <string.h>

@implementation MyArray
- (void) sortWithCountries:(char *[])countries andLength:(int)len
{
    for (int i = 0; i < len - 1; i++)
    {
        for (int j = 0; j < len - i - 1; j++)
        {
            //这里可以不用写死，传一个BOOL (^compareBlock)(char *country1, char *country2)
            //就可以让调用者自己定义如何比较。
            if (strcmp(countries[j], countries[j+1]))
            {
                char *temp = countries[j];
                countries[j] = countries[j+1];
                countries[j+1] = temp;
            }
        }
    }
}

- (void) sortWithCountries:(char *[])countries andLength:(int)len andCompareBlock:(BOOL (^)(char *country1, char *country2))compareBlock
{
    for (int i = 0; i < len - 1; i++)
    {
        for (int j = 0; j < len - i - 1; j++)
        {
            //调用用户传入的比较方法
            BOOL res = compareBlock(countries[j], countries[j+1]);
            if (res == YES)
            {
                char *temp = countries[j];
                countries[j] = countries[j+1];
                countries[j+1] = temp;
            }
        }
    }
}
@end
