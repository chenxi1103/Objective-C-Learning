//
//  Microblog.m
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import "Microblog.h"

@implementation Microblog

- (void)dealloc
{
    NSLog(@"Microblog is deleted.");
    [_content release];
    [_imgURL release];
    [_user release];
    [_reTweet release];
    
    [super dealloc];
}

- (void) describeBlog
{
    NSLog(@"%@ posted a microblog with content: %@\nImage URL: %@", _user.nickName, _content, _imgURL);
}
@end
