//
//  Microblog.h
//  微博练习
//
//  Created by Li, Chenxi on 3/26/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Microblog : NSObject

@property(nonatomic, retain)NSString *content;
@property(nonatomic, retain)NSString *imgURL;
@property(nonatomic, assign)WBDate publishTime;
@property(nonatomic, retain)User *user;
@property(nonatomic, retain)Microblog *reTweet;

- (void) describeBlog;
@end
