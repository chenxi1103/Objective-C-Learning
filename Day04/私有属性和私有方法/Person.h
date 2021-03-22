//
//  Person.h
//  私有属性和私有方法
//
//  Created by Li, Chenxi on 3/22/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//
/**
 private -> 只能内部访问，但在外界，xcode依然会提示对象中有这个属性，只不过无权访问。
 如果想实现真正私有，把属性copy到implementation的大括弧中。外界不会提示。
 */
#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @private
    NSString *_name;
    int age;
}
- (void) sayHi;
@end
