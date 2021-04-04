//
//  classAndObject.m
//  Day01
//
//  Created by Li, Chenxi on 3/7/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

/*
 类的定义分两部分
 1. 类的声明
 @interface 类名
 {
    属性 属性表示类的特征
 }
 方法的声明写在这里，方法表示类的功能
 @end
 
 2. 类的实现
 @implementation 类名
 将方法的实现写在这里
 @end
 
    无参数的方法
    a. 声明
        1. 位置：写在大括号的外面
        2. 语法：
            - （返回值类型）方法名称
            - (返回值类型）方法名称：（参数类型）形参名称
 
 3. 几点注意
    a. 类一定要有定义有实现
    b. 类名用你描述的事物的名称来命名就可以，类名首字母必须大写
    c. NSObject superclass
    d. 定义在大括号中用来表示某类事物共同特征的变量叫做：属性/成员变量/实例变量/字段
    f. 为类定义属性的时候，属性名必须以下划线开头
 
 4. 如何创建一个类的对象
    语法： 类名 *对象名 = [类名 new]
 
 5. 如何访问对象属性
    a. 默认情况下，对象属性是不允许被外界直接访问的，如果允许对象属性被外界访问，就加一个@public
    b. 访问对象属性的方式
       对象名->属性名 = 值；（recommended）
       对象名->属性名；
 
       (*对象名).属性名
 
 6. 带参数的方法声明规范
    a. 如果方法只有一个参数，最好这个方法的名字叫做 xxxWith
       这样写，调用方法时看起来像一条完整的语句，提高代码可读性。
 
 7. 在方法的实现中，可以直接访问属性
 
 */

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    @public
    NSString *_name;
    int _age;
    int _chinese;
    int _math;
    int _english;
    int _c;
}

- (void) run;
- (void) eatWith: (NSString *)foodname;
- (int) sum: (int)num1 : (int)num2;
@end

@implementation Student
- (void) run
{
    NSLog(@"running...");
}
- (void) eatWith:(NSString *)foodname
{
    NSLog(@"I am eating %@", foodname);
}
- (int) sum:(int)num1 :(int)num2
{
    int result = num1 + num2;
    NSLog(@"%d + %d = %d", num1, num2, result);
    return result;
}
@end

int main (int argc, const char *argv[])
{
    Student *s1 = [Student new];
    s1->_name = @"Deborah";
    s1->_age = 22;
    s1->_chinese = 100;
    s1->_math = 99;
    s1->_english = 98;
    (*s1)._c = 23;
    
    NSLog(@"Student name: %@, Chinese score %d, Math score %d, English score %d", s1->_name, s1->_chinese, s1->_math, s1->_english);
    
    [s1 run];
    [s1 eatWith:@"apple"];
    [s1 sum: 100 :50];
}
