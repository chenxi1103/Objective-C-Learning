//
//  main.m
//  block
//
//  Created by Li, Chenxi on 3/27/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyArray.h"
#import <string.h>
typedef void(^blockType)(void);
void test(blockType block1)
{
    NSLog(@"---------------------");
    block1();
    NSLog(@"---------------------");
}

int main(int argc, const char * argv[]) {
    typedef void(^blockType1)(void); // void (^myBlock)(void);
    typedef int(^blockType2)(int num1, int num2); // int (^myBlock2)(int num1, int num2);
    blockType1 myBlock;
    blockType2 myBlock2;
    myBlock = ^void(){
        NSLog(@"In myBlock.");
    };
    
    test(myBlock);
    
    myBlock2 = ^int(int num1, int num2) {
        return num1 + num2;
    };
    
    MyArray *arr = [MyArray new];
    char *countries[] =
    {
        "China",
        "Nepal",
        "Cambodia",
        "Singapore",
        "Bangladesh",
        "India"
    };
    typedef BOOL (^comparitor1)(char *country1, char *country2);
    comparitor1 comparitorBlock = ^BOOL(char *country1, char *country2) {
        int res = (int)strlen(country1) - (int)strlen(country2);
        if (res > 0)
        {
            return YES;
        }
        return NO;
    };
    [arr sortWithCountries:countries andLength:sizeof(countries)/8 andCompareBlock:comparitorBlock];
    for (int i = 0; i < sizeof(countries)/8; i++)
    {
        NSLog(@"%s",countries[i]);
    }
}
