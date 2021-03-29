### Day 08 - block与协议（重要）
#### __1. 延展（extension）__
- 延展是一个特殊的分类（是一个分类category），是类的一部分。特殊之处在于：
    - 延展这个特殊分类没有名字。
    - 只有声明，没有实现，和本类共享一个实现。
- 延展的语法：
    ```
    @interface 本类名 ()
    
    @end
    ```
- 延展文件添加过程：
    - new file -> objective-c file -> "FileType":Extension
    - 生成一个h文件，文件名：本类名_延展名.h，这个文件中只有延展的声明。实现应该在本类的m文件中实现。
- 延展和分类的区别
    - 分类有名字，延展没有名字，是一个匿名的分类。
    - 每个分类都有单独的声明和实现，而延展中只有声明，没有单独的实现
    - 分类只能新增方法，延展中任意的成员都可以写。
    - 分类中可以写@property，但智慧生成getter/setter的声明，延展当中写@property，会自动生成私有属性，也会生成getter/setter的声明实现。
- 延展的使用场景：
    - 要为类写一个私有的@property（其getter/setter方法只能在本类内部中使用，不能外部访问）：只让@property生成私有属性，生成getter/setter的实现但不要生成声明，此时可以使用延展。延展100%的情况下不会独占一个文件，都是将延展直接写在本类的实现文件（m文件）当中。这个时候写在延展中的成员就相当于这个类的私有成员，只能在本类的实现当中访问，外部不能访问。
    如果想要为类写一个真私有属性，虽然可以定义在@implementation中，但是这样写不规范，规范是写在延展中。
    - 声明在延展内的方法就是私有方法，如果是私有方法，也要声明在延展中。（虽然只在implementation中实现而不声明也可以做到，这样做可以提高代码可读性）
    - 延展天生就是来私有化类的成员的。

#### __2. block的基本使用__
OC在C的基础上新增了一些数据类型：BOOL/Boolean/class/nil/SEL/id/block
block是一种数据类型，那么可以声明这个数据类型的变量。那么block类型的变量中可以存储什么样的数据？-> block类型的变量中是用来专门存储一段代码的，这段代码可以有参数可以有返回值。
- 如何声明一个block变量
    - 虽然block变量中是用来存储一段代码，但是一个block并不是任意一段代码都能存进去，而是有限定的。在声明block变量时，必须要制定这个代码段是否有参数，几个参数，是否有返回值。一旦指定，这个block里就只能存储这样的代码。
    - 例子：返回值void， 参数一个，int类型
    - 语法：返回值类型（^block变量名称）（参数列表）;
    ```
    void (^myBlock1)(); //声明了一个block叫myBlock1，只能存储没有返回值，没有参数的代码。
    int (^myBlock2)();
    int (^myBlock3)(int num1, int num2);
    ```
    - 最重要的：声明block变量的时候指定这个block变量可以存储代码段的返回值和参数描述，一旦指定，这个block变量中就只能存储这样的代码段，其他格式的代码段都无法存储。
- 初始化block变量
    - 原理：写一个符合block要求的代码段，存储在block变量中即可。
    - 格式：^返回值类型（参数列表）{代码段}；
    ```
    void(^myBlock1)();
    myBlock1 = ^void(){
        NSLog(@"Test");
    }
    int (^myBlock2)(int num1, int num2) = ^int(int num1, int num2) {
        return num1 + num2;
    };
    ```
- 执行block中的代码段
    ```
    myBlock1();
    int sum = myBlock2(1, 2); //sum = 3
    ```
- block的简写：
    - 不管代码段有没有返回值，代码段的返回值类型可以省略。（声明block变量的返回值无论是什么都不可以省略！）
    ```
    void(^myBlock1)() = ^(){
        NSLog(@"In myBlock1");
    }
    int (^myBlock2)() = ^{
        int num1 = 10 + 20;
        return num1;
    }
    int (^myBlock2)(int, int) = ^(int num1, int num2) {
        return num1 + num2;
    };
    ```
    - 如果我们写的代码段没有参数，代码段的小括号可以省略。（声明block变量的小括号不可以省略！）
    ```
    int (^myBlock2)() = ^int{
        int num1 = 10 + 20;
        return num1;
    }
    ```
    - 声明block变量的时候如果有指定参数，可以只写参数类型而不写参数名称。(此时只有声明部分可以省略，代码段类型和名称都要写。)
    ```
    int (^myBlock2)(int, int) = ^int(int num1, int num2) {
        return num1 + num2;
    };
    ```
    - 建议：仍然按照最标准的方法来写block变量和代码段，可以提高代码的可读性。
- 简化block变量的复杂定义
    - 问题：定义block变量的时候，要写好大一串，类型很长。
    - 解决方法：typedef。 typedef的使用场景：将一个长类型定义为短类型。
    ```
    typedef void(^blockType1)(void); // void (^myBlock)(void);
    typedef int(^blockType2)(int num1, int num2); // int (^myBlock2)(int num1, int num2);
    blockType1 myBlock;
    blockType2 myBlock2;
    myBlock = ^void(){
        NSLog(@"In myBlock.");
    };
    
    myBlock2 = ^int(int num1, int num2) {
        return num1 + num2;
    };
    ```
- 如何在block内部访问外部的变量？
    - 在block代码块的内部可以取定义在外部的变量的值，包括定义在外部的局部变量和全局变量。
    - 在block代码块的内部可以修改全局变量的值，但是不能修改定义在外部的局部变量的值。
    - 如果想让外部的局部变量可以允许在block代码的内部去修改，那么就为这个局部变量加一个__block修饰符
#### __3. block作为函数的参数和返回值__
- block的应用
    - 作为函数的参数:
        - 为函数定义block类型的参数：就在括弧中声明一个指定格式的block变量即可。
    - 如何调用带block参数的函数：
        - 要求在调用的时候传入一个和形参block要求的代码段。
        - 调用的时候，可以先讲代码段存储到一个block变量中，然后再传递这个block变量，也可以直接将符合要求的代码段写在小括号中传递。
        - 小技巧，通过xcode提示可以快速的生产block代码段的框架。
    - 将block作为函数的参数可以实现什么效果
        - 可以将调用者自己写的一段代码，传递到函数的内部去执行。
    - 应用实例：
    ```
    MyArray *arr = [MyArray new];
    char *countries[] =
    {
        "China",
        "Nepal",
        "Cambodia",
        "Singapore",
        "Bangladesh",
        "India"
    };

    typedef BOOL (^comparitor1)(char *country1, char *country2);
    comparitor1 comparitorBlock = ^BOOL(char *country1, char *country2) {
        int res = (int)strlen(country1) - (int)strlen(country2);
        if (res > 0)
        {
            return YES;
        }
        return NO;
    };
    //传入用户自己实现的comparitorBlock。
    [arr sortWithCountries:countries andLength:sizeof(countries)/8 andCompareBlock:comparitorBlock];
    for (int i = 0; i < sizeof(countries)/8; i++)
    {
        NSLog(@"%s",countries[i]);
    } // China Nepal India Cambodia Singapore Bangladesh
    ```
    - 当block作为函数的返回值：
        - 返回值类型必须要用typedef来定义的短类型

- block与函数的对比
    - 相同点：都是封装一段代码
    - 不同点：
        1. block是一个数据类型，函数不是。
        2. 所以我们可以声明block类型的变量，函数只是函数
        3. block可以作为函数的参数，函数不可以（除非用指向函数的指针）。

#### __4. 协议的基本使用__
- 协议：protocol
    - 作用：
        - 专门用来声明一大堆方法（不能声明属性，也不能实现方法，只能用来写方法的声明）。
        - 只要某个类遵守了这个协议，就相当于拥有这个协议中所有的方法声明。
    - 声明：
        ```
        @protocol 协议名称 <NSObject>
        方法的声明
        @end
        ```
        新建一个协议的方式：NewFile -> OC-File -> protocal。
        协议的文件名后缀：.h，只有一个h文件。
    - 总结：在协议中，只能用来声明方法，协议的作用就是专门用来写方法声明的。

- 类遵守协议
    - 协议就是用来写方法声明的，就是用来被类遵守的。
    - 如果想要一个类拥有协议中定义的所有方法声明，那么就让类遵守这个协议，类只要遵守这个协议，那么这个类就拥有了这些协议中定义的所有方法声明。
    ```
    @interface 类名：父类名 <协议名称> //：表示继承，<>表示遵守的协议
    @end
    ```
    - 当一个类遵守了一个协议，那么就相当于这个类拥有了协议中定义的所有的方法的声明，这个只是拥有了声明但没有实现，这个类应在implementation中实现该协议中的方法。
    - 如果类不实现protocol中的方法，编译器不会报错只会警告，但是当调用方法的时候会报错。
- 类是单继承，但是协议可以多遵守
    - 一个类只能拥有一个父类，但是一个类可以同时遵守多个协议
    ```
    @interface 类名：父类名 <协议名称1， 协议名称2>
    @end
    ```



#### __5. 代理设计模式（delegator）__