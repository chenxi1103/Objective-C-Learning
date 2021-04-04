//
//  main.m
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Microblog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Account *a1 = [Account accountWithUserName:@"Lexi" andPassword:@"123456"];
        [a1 describeAccount];
        User *u1 = [User userWithNickName:@"LexiBaby" andBirthday:(WBDate){1995, 11, 03} andAccount:a1];
        
        Microblog *blog = [[Microblog new] autorelease];
        blog.content = @"Such a great weather today!";
        blog.imgURL = @"https://www.weather.com/today.png";
        blog.user = u1;
        blog.reTweet = nil;
        [blog describeBlog];
        
        Account *a2 = [Account accountWithUserName:@"Debby" andPassword:@"654321"];
        [a2 describeAccount];
        User *u2 = [User userWithNickName:@"DebbyQueen" andBirthday:(WBDate){1997, 11, 03} andAccount:a2];
        
        Microblog *blog2 = [[Microblog new] autorelease];
        blog2.content = @"I agree!";
        blog2.imgURL = @"https://www.weather.com/today.png";
        blog2.user = u2;
        blog2.reTweet = blog;
        [blog2 describeBlog];
    }
    return 0;
}
