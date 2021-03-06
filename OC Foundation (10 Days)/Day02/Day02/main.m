//
//  main.m
//  Day02
//
//  Created by Li, Chenxi on 3/8/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//
/**
1. 内存中的五大区域
    栈：存储局部变量
    堆：程序员手动申请的字节空间（malloc/calloc/realloc）
    bss段：存储未被初始化的全局变量，静态变量
    数据段：（常量区）存储已被初始化的全局变量，静态变量，常量数据
    代码段：存储代码
 
 2. 类加载
        a.在创建对象的时候，肯定要访问类
        b.声明一个类的指针变量也会访问类
 
        在程序运行期间，当某个类第一次被访问到的时候，会将这个类存储在内存中的代码段区域，这个过程叫做类的加载
        一旦类被加载到代码段后，直到程序结束的时候，才会被释放
 
 3. 对象在内存中是如何存储的
    Person *p1 = [Person new]
    1. Person *p1会在栈内存中申请一块空间，在栈l内存中声明一个person类型的指针变量p1，p1是一个指针变量，只能存地址
    2. [Person new] 真正在内存中创建对象实际是这句代码
        a.在堆内存中申请一块合适大小的空间
        b. 在这个空间中根据的类的模版创建对象
            对象中还有另外一个属性，叫做isa，是一个指针，这个指针指向对象所属的类所在代码段的位置
        c.初始化对象的属性
            赋默认值：如果属性的类型是基本数据类型，那么就赋值为0，
                    如果属性的类型是c语言的指针类型，那么就赋值为null
                    如果属性的类型是oc语言的指针类型，那么就赋值为nil
         3. p1:地址，*p1取地址里的东西
 
        注意：
            a. 对象中只有属性没有方法，自己类的属性外加一个isa指针指向代码段中的类
            b. 如何访问对象的属性：指针名->属性名 （根据指针，招到指针指向的对象，再找到对象中的属性来访问）
            c. 如何调用方法
                [指针名 方法名]
                先根据指针名找到对象，对象发现要调用方法，再根据对象的isa指针找到类，然后调用类里面的方法
 
 4. NULL: 可以作为指针变量的值，如果1个指针变量的值是NULL代表这个指针不指向内存的任何空间，NULL其实等价于0, NULL其实是一个宏，就是0.
 5. nil只能作为指针变量的值，代表这个指针变量不指向内存中的任何空间，nil也等价于0，也是一个宏. NULL和nil其实是一样的
   虽然使用null的地方可以使用nil，使用nil的地方可以使用null，但是不建议乱用。 c指针用null，oc指针用nil，如果oc指针是nil，用这个指针调用对象属性，这个时候会报错，但如果用这个指针调用对象的函数，不会报错，但也不会运行这个函数
 6. 同类型的指针变量之间可以相互赋值
    Person *p1 = [Person new];
    Person *p2 = p1;
    不论用p1还是p2修改的是相同的对象
 
 7. 分组导航标记
    a. #pragma mark分组名
    b.#pragma mark - (产生分割线）
 
 8. 方法与函数
    C中的函数是函数，写在oc类里的方法叫方法
    不同点：
    a语法不同。oc方法可以声明在interface里，可以在implementation里实现，函数除了在函数的内部和interface的大括弧中，都可以写。
    b. 调用方式也不一样，方法需要先创建对象，函数可以直接调用
    c.  就算把函数写在类中，这个函数也不属于这个类，创建的对象里也没有这个函数，不要吧函数写入类中，虽然这样是可以的，但是非常不规范。
 
 9. 最容易犯错的点：
    a. interface和implementation不能相互嵌套
    b. 类的声明要放在实现的前面
    c. 类的声明和实现都要有
    d. 类的声明要在使用类前面，实现可以放在使用类的后面
    e. 特殊情况下可以只有实现没有声明，但是不建议这样写
    f.  属性名一定要以下划线开头，每一个单词的首字母要大写
    g. 属性不可以在声明的时候赋值
    h. oc方法必须创建对象来调用
    i. 方法只有声明没有实现，不会报错只会警告。如果指针指向的对象，有方法的声明，没有方法的实现，那此时用指针调用这个方法在运行时会报错（unrecognized selector)
 
 10.  多文件开发：
    把一个类写在一个模块中，一个模块至少包含两个文件
    .h头文件：写类的声明
    .m实现文件：写类的实现
    如果要用到类，只需要引入模块的头文件就可以了
    
    创建类模块更简洁的方式：创建Cocoa Class，自动将类的声明和实现写好。建议模块的文件名和类名保持一致
 
 11. 对象和方法：
    对象作为方法的参数，对象作为方法的返回值
    类的本质是我们自定义的一个数据类型
    数据类型：是在内存中开辟空间的一个模版
 
 -------------------语法注意---------------------
 1. 如果对象作为方法的参数时，参数类型时类指针
    - (void) test : (Dog *) dog;
 2. 调用方法的时候，如果方法的参数是一个对象，那么给实参的时候，实参要求也必须是符合要求的对象
 3. 当对象作为方法参数传递的时候，是地址传递，所以在方法内部通过形参取修改形参指向的对象的时候，会影响实参变量指向的对象的值。
 
 ------------------------------------------------------
 对象也可以作为方法的返回值
 1. 什么时候方法的返回值是对象？
    当方法执行完毕之后，如果1个对象方法内部不知道如何处理，且调用者还需要对象，对象就该返回。
 2. 如果要返回对象，返回值应该是类的指针
  ------------------------------------------------------
 12. 一个target中的类无法直接在另外一个target中访问
    类的属性代表什么：类的属性代表这类事物具有的特征，代表这个类所拥有的东西，如何分析类有哪些属性？拥有的东西可以作为类的属性。
    类的方法代表什么：代表这个类所具备的行为，这个类所具备的功能。
 */

#import <Foundation/Foundation.h>
#import "God.h"

int main(int argc, const char * argv[])
{
    God *g1 = [God new];
    g1->_name = @"God";
    g1->_age = 99999;
    g1->_gender = GenderMale;
    
    Person *p1 = [Person new];
    p1->_name = @"Mike";
    p1->_age = 21;
    p1->_leftLife = 70;
    p1->_gender = GenderMale;
    
    [g1 killWithPerson:p1];
    NSLog(@"%@ has life: %d", p1->_name, p1->_leftLife);
    
    Person *p2 = [g1 makePersonWithName:@"Lexi" andGender:GenderFemale andLeftLife:100];
    NSLog(@"New person created with name: %@, gender: %u, with leftLife: %d", p2->_name, p2->_gender, p2->_age);
}
