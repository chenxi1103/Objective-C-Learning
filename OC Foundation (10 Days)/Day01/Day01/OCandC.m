//
//  OCandC.m
//  Day01
//
//  Created by Li, Chenxi on 3/7/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

/*
 1. OC程序的编译，连接，执行
    a. 在.m文件中写上符合oc语法规范的源代码
    b. 使用编译器将源代码编译为目标文件
        cc -c xx.m
        a. 预处理
        b. 检查语法
        c. 编译
    c. 链接
        cc xx.o -framework Foundation
        如果程序中使用到了框架中的函数或者类，那么在链接的时候，就必须告诉编译器去哪个框架找函数和类
    d. 链接成功后，就会生成a.out可执行文件，执行即可
 
 2. oc程序和c程序各个阶段后缀名对比
    源文件        目标文件。       可执行文件
 c   .c           .o              .out
 oc  .m           .o              .out
 
 3. oc中的数据类型
    a. oc支持c语言中所有的数据类型
        1. 基本数据类型：int double float char
        2. 构造类型: 数组，结构，枚举
        3. 指针类型： int *p1
        4. 空类型: void
        5. typedef自定义类型
        6. BOOL类型（本质：signed char)：可以存储YES或NO中的任意一个数据
                    一般情况BOOL类型的变量用来存储条件表达式的结果，如果条件表达式成立，结果是yes
        7. Boolean (本质：unsigned char)=--
           a. Boolean可存储true和false，也是用来存储条件表达式的结果
        8. class 类型
        9. id类型，万能指针
        10. nil 与null差不多
        11. SEL 方法选择器
        12. block 代码段
 
 */

#import <Foundation/Foundation.h>

//int main()
//{
//    NSLog(@"xxx");
//}
