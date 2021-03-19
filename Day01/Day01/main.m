//
//  main.m
//  Day01
//
//  Created by Li, Chenxi on 3/4/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

/*
 1. OC相对于C
    a. 在C的基础上z新增了一小部分面向对象的语法
    b. 将c复杂的语法封装的更为简单
 
 2. oc程序的源文件后缀名是m，m代表message，代表oc中最重要的机制->消息机制，c程序的后缀名d是c
 3. main函数依然是oc程序的入口和出口
    int类型的返回值代表程序结束的状态
    main函数的参数，仍然可以接受用户在运行程序的时候传递数据给程序
 
 4. #import指令
    以#开头，一个预处理指令
    是#include指令的增强版，将文件的内容在预处理的时候拷贝到写指令的地方
    增强:不论同一个文件w被import几次，都只包含一次。如果include指令a要实现这个效果，必须配合编译指令来实现
    原理：import指令在包含文件的时候，底层会先判断这个文件是否被包含。
 
 5. 框架
    是一个功能集，苹果或者第三方事先将在开发程序的时候经常用到的函数实现写好
    把这些功能封装在类或函数中，类和函数的集合就是框架。
 
 6. Foundation框架：提供最基础的功能，输入输出，常用类，一些数据类型
    Foundation.hw中包含了Foundation框架里所有的头文件
 
 7. autoreleasepool自动释放池
    代码可以写在自动释放池中，也可以删除这个池删除，也不会有任何影响。
 
 8. NSLog函数: printf的增强版，向控制台输出信息。语法：前面加@，是格式控制字符串，变量列表
    NSLog(@"输出的信息“）
    a. 输出一些调试相关信息：
       执行代码的时间，程序的名字，进程号码（每个正在运行的程序都是一个进程），线程编号，NSLog输出的信息。
    b. 再次输出会自动换行
    c. oc中新增了一些数据类型，这些数据类型只能用NSLog函数来输出值，不能用printf
    d. 用法和printf用法差不多m，一样可以c输出变量值，占位符和用法一样
    e. 使用注意：
        1. NSLog函数第一个参数前面必须加一个@
        2. 如果在字符串后面加了\n，自动换行失效（它自己会自动换行）
 
 9. c语言的字符串的存储方式有两种：1. 字符数组存储，2.字符指针来存储
    oc设计了更为好用的存储字符串的类型：NSString
    NSString类型的指针变量专门用来存储oc字符串的地址
    oc的字符串常量必须需要一个前缀@符号
        “jack”是c语言字符串
        @“jack”是oc字符串
    NSString变量的指针变量只能存储oc字符串的地址
 
 10. NS前缀
     NS = NextStep
     NextStep -> Cocoa -> Foundation
 
 11. @符号
     a. 将c字符串转换为oc字符串
     b. oc绝大部分关键字都是以@符号开头
 
 12. 注释
     和c一模一样，分单行和多行注释
 
 13. 函数的定义和调用
     与c语言的定义和调用是一样的
     
 */
#import <Cocoa/Cocoa.h>

//import <框架名/头文件>
#import <Foundation/Foundation.h>

void test(void);


//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        test();
//    }
//    return NSApplicationMain(argc, argv);
//}

void test()
{
    NSString *name = @"Deborah";
    NSLog(@"Hello, I'm %@", name);
}
