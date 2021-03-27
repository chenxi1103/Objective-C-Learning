//
//  Account.h
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

typedef struct {
    int year;
    int month;
    int day;
} WBDate;

@property(nonatomic, retain) NSString *userName;
@property(nonatomic, retain) NSString *password;
@property(nonatomic, assign) WBDate registerDate;

- (void) describeAccount;
- (instancetype) initWithUserName:(NSString *)userName andPassword:(NSString *)password;
+ (instancetype) account;
+ (instancetype) accountWithUserName:(NSString *)userName andPassword:(NSString *)password;

@end
