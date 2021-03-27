//
//  User.m
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "User.h"

@implementation User

-(void)dealloc
{
    NSLog(@"User %@ is not active.", _nickName);
    [_nickName release];
    [_account release];
    [super dealloc];
}

- (instancetype) initWithNickName: (NSString *)nickName andBirthday: (WBDate)birthday andAccount: (Account *)account
{
    if (self = [super init]) {
        self.nickName = nickName;
        self.birthday = birthday;
        self.account = account;
    }
    return self;
}
+ (instancetype) user
{
    return [[self alloc] init];
}
+ (instancetype) userWithNickName: (NSString *)nickName andBirthday: (WBDate)birthday andAccount: (Account *)account
{
    return [[[self alloc] initWithNickName:nickName andBirthday:birthday andAccount:account]autorelease];
}

@end
