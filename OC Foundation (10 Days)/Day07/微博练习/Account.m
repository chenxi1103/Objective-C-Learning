//
//  Account.m
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Account.h"

@implementation Account

-(void) dealloc
{
    NSLog(@"Account %@ is not active.", _userName);
    [_userName release];
    [_password release];
    [super dealloc];
}

- (void) describeAccount
{
    NSString *date = [NSString stringWithFormat:@"%d-%d-%d", _registerDate.year, _registerDate.month, _registerDate.day];
    NSLog(@"Username: %@, Password: %@, RegisterDate: %@", _userName, _password, date);
}

- (instancetype) initWithUserName:(NSString *)userName andPassword:(NSString *)password
{
    if (self = [super init]) {
        self.userName = userName;
        self.password = password;
        self.registerDate = [self toWBDateWithCurrentTime:[self getCurrentTime]];
    }
    return self;
}

- (NSString *) getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    return currentTime;
}

- (WBDate) toWBDateWithCurrentTime:(NSString *)currentTime
{
    NSArray *arrayOfTime = [currentTime componentsSeparatedByString:@"-"];
    int year = [arrayOfTime[0] integerValue];
    int month = [arrayOfTime[1] integerValue];
    int day = [arrayOfTime[2] integerValue];
    WBDate date = {year, month, day};
    return date;
    
}
+ (instancetype) account
{
   return [[self alloc] init];
}

+ (instancetype) accountWithUserName:(NSString *)userName andPassword:(NSString *)password
{
    return [[[self alloc] initWithUserName:userName andPassword:password]autorelease];
}

@end
