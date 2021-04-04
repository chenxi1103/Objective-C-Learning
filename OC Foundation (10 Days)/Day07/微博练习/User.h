//
//  User.h
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface User : NSObject

@property(nonatomic, retain) NSString *nickName;
@property(nonatomic, assign) WBDate birthday;
@property(nonatomic, retain) Account *account;

- (instancetype) initWithNickName: (NSString *)nickName andBirthday: (WBDate)birthday andAccount: (Account *)account;
+ (instancetype) user;
+ (instancetype) userWithNickName: (NSString *)nickName andBirthday: (WBDate)birthday andAccount: (Account *)account;

@end
