# Objective-C-Learning
每日笔记存在DayXX的main.m中。同时也会在readme里进行更新。
OC课程视频链接：https://www.bilibili.com/video/BV1NJ411T78u

### Day 01 - OC语言概述
1. OC相对于C
    a. 在C的基础上z新增了一小部分面向对象的语法
    b. 将c复杂的语法封装的更为简单
 
 2. oc程序的源文件后缀名是m，m代表message，代表oc中最重要的机制->消息机制，c程序的后缀名d是c
 3. main函数依然是oc程序的入口和出口
    int类型的返回值代表程序结束的状态
    main函数的参数，仍然可以接受用户在运行程序的时候传递数据给程序
 
 4. “#import”指令
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
    1. 输出一些调试相关信息：
       执行代码的时间，程序的名字，进程号码（每个正在运行的程序都是一个进程），线程编号，NSLog输出的信息。
    2. 再次输出会自动换行
    3. oc中新增了一些数据类型，这些数据类型只能用NSLog函数来输出值，不能用printf
    4. 用法和printf用法差不多m，一样可以c输出变量值，占位符和用法一样
    5. 使用注意：
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
    

 ### Day02 - OC基本语法
 1. 内存中的五大区域
    栈：存储局部变量
    堆：程序员手动申请的字节空间（malloc/calloc/realloc）
    bss段：存储未被初始化的全局变量，静态变量
    数据段：（常量区）存储已被初始化的全局变量，静态变量，常量数据
    代码段：存储代码
 
 2. 类加载
        a.在创建对象的时候，肯定要访问类
        b.声明一个类的指针变量也会访问类
 
        在程序运行期间，当某个类第一次被访问到的时候，会将这个类存储在内存中的代码段区域，这个过程叫做类的加载。一旦类被加载到代码段后，直到程序结束的时候，才会被释放
 
 3. 对象在内存中是如何存储的
    Person *p1 = [Person new]
    1. Person *p1会在栈内存中申请一块空间，在栈l内存中声明一个person类型的指针变量p1，p1是一个指针变量，只能存地址
    2. [Person new] 真正在内存中创建对象实际是这句代码
        1.在堆内存中申请一块合适大小的空间
        2. 在这个空间中根据的类的模版创建对象
            对象中还有另外一个属性，叫做isa，是一个指针，这个指针指向对象所属的类所在代码段的位置
        3.初始化对象的属性
            赋默认值：如果属性的类型是基本数据类型，那么就赋值为0，
                    如果属性的类型是c语言的指针类型，那么就赋值为null
                    如果属性的类型是oc语言的指针类型，那么就赋值为nil
    3. p1:地址，*p1取地址里的东西

    注意：
    1. 对象中只有属性没有方法，自己类的属性外加一个isa指针指向代码段中的类
    2. 如何访问对象的属性：指针名->属性名 （根据指针，招到指针指向的对象，再找到对象中的属性来访问）
    3. 如何调用方法：[指针名 方法名] 先根据指针名找到对象，对象发现要调用方法，再根据对象的isa指针找到类，然后调用类里面的方法
 
 4. NULL: 可以作为指针变量的值，如果1个指针变量的值是NULL代表这个指针不指向内存的任何空间，NULL其实等价于0, NULL其实是一个宏，就是0.

 5. nil只能作为指针变量的值，代表这个指针变量不指向内存中的任何空间，nil也等价于0，也是一个宏. NULL和nil其实是一样的
   虽然使用null的地方可以使用nil，使用nil的地方可以使用null，但是不建议乱用。 c指针用null，oc指针用nil，如果oc指针是nil，用这个指针调用对象属性，这个时候会报错，但如果用这个指针调用对象的函数，不会报错，但也不会运行这个函数

 6. 同类型的指针变量之间可以相互赋值
    Person *p1 = [Person new];
    Person *p2 = p1;
    不论用p1还是p2修改的是相同的对象
 
 7. 分组导航标记
    1.#pragma mark分组名
    2.#pragma mark - (产生分割线）
 
 8. 方法与函数
    C中的函数是函数，写在oc类里的方法叫方法
    不同点：
    1. 语法不同。oc方法可以声明在interface里，可以在implementation里实现，函数除了在函数的内部和interface的大括弧中，都可以写。
    2. 调用方式也不一样，方法需要先创建对象，函数可以直接调用
    3.  就算把函数写在类中，这个函数也不属于这个类，创建的对象里也没有这个函数，不要吧函数写入类中，虽然这样是可以的，但是非常不规范。
 
 9. 最容易犯错的点：
    1. interface和implementation不能相互嵌套
    2. 类的声明要放在实现的前面
    3. 类的声明和实现都要有
    4. 类的声明要在使用类前面，实现可以放在使用类的后面
    5. 特殊情况下可以只有实现没有声明，但是不建议这样写
    6.  属性名一定要以下划线开头，每一个单词的首字母要大写
    7. 属性不可以在声明的时候赋值
    8. oc方法必须创建对象来调用
    9. 方法只有声明没有实现，不会报错只会警告。如果指针指向的对象，有方法的声明，没有方法的实现，那此时用指针调用这个方法在运行时会报错（unrecognized selector)
 
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
 
 ----------------------------------------
#### 语法注意
 1. 如果对象作为方法的参数时，参数类型时类指针
    - (void) test : (Dog *) dog;
 2. 调用方法的时候，如果方法的参数是一个对象，那么给实参的时候，实参要求也必须是符合要求的对象
 3. 当对象作为方法参数传递的时候，是地址传递，所以在方法内部通过形参取修改形参指向的对象的时候，会影响实参变量指向的对象的值。
 
对象也可以作为方法的返回值
 1. 什么时候方法的返回值是对象？
    当方法执行完毕之后，如果1个对象方法内部不知道如何处理，且调用者还需要对象，对象就该返回。
 2. 如果要返回对象，返回值应该是类的指针
 ----------------------------------------

 12. 一个target中的类无法直接在另外一个target中访问
    类的属性代表什么：类的属性代表这类事物具有的特征，代表这个类所拥有的东西，如何分析类有哪些属性？拥有的东西可以作为类的属性。
    类的方法代表什么：代表这个类所具备的行为，这个类所具备的功能。
    
 ### Day03 - 异常处理/类方法/面向对象初窥
 1. 异常处理
    1. 我们写的源代码不符合语法规范，然后编译报错 -> 程序无法编译
    2. bug：程序可编译，可链接，可执行，但程序执行结果不符合预期 -> 通过调试寻找发生bug的原因
    3. 异常：程序可以编译，可链接，可执行，当程序执行的时候，处于某种特定条件下，程序的执行就会终止 -> 程序会立即中止运行，并且后面的代码不会执行 （ios程序闪退）
    4. 处理异常：为了让程序在执行的时候发生义仓你不会崩溃，而是继续执行。将可能发生异常的代码放在try中，如果发生异常，不会崩溃而是立刻跳转到catch中执行里面的代码。finally块中的代码，无论try中是否发生了异常，finally都会执行
    5. try catch不是万能的，不是所有的运行时错误都能处理。C语言的异常是无法处理的，在实际开发中用的相对较少。避免异常最常用的方式还是用if判断
          语法：
```
            @try
            {
            }
            @catch(NSException *ex)
            {
                (%@打印指针指向的对象）
                NSLog(@"%@", ex);
            }
            @finally
            {
            }
```          
      
 
 2. oc中的方法分为两类：
    1. 对象方法/实例方法：想调用方法，就得创建对象
        -> 声明： - (void) sayhi;
    2. 类方法：调用不依赖对象，如果要调用类方法，不需要创建对象，直接通过类名来调用
        -> 声明： + (void) sayhi;
           调用：[类名 类方法名]

 3. 分析类方法调用的
    类方法的特点：
    1. 节约空间：因为调用类方法不用创建对象，这样节约空间
    2. 提高效率：因为调用类方法不需要拐弯，直接找到类，直接执行类中的方法
    3. 但是类方法无法直接访问内部属性。
        因为属性是在对象创造的时候，跟随对象一起创建在对象中
        类第一次被访问的时候，会做类加载，是把类的代码存储在代码段
    因为属性只有在对象创建的时候才会被创建在对象之中，而类方法在执行的时候可能还没有对象，虽然不能直接访问属性，但是我们可以在类方法中创建一个对象去访问这个对象的属性。
    4. 在类方法中不能通过self字节调用当前类的其他的对象方法，因为对象方法只能通过对象来调用，而这个时候没有对象。
    5. 在对象方法中可以直接调用类方法。
    6. 什么时候可以将方法l定义为类方法：
        1. 如果方法不需要直接访问属性，也不需要直接调用其他的对象方法，那么可以直接将方法定义为类方法，这样可以节约空间，提高效率
        2. 类方法的规范：如果我们写一个类，那要求提供一个和类名同名的类方法，这个方法创建一个最纯洁的类的实现。（constructor）苹果和第三方写的类都遵守这个规范。
        3. 如果希望创建的对象由调用者制定，就为这个类方法带参数：类名WithXXX。。。（苹果都遵守这个规范）
    
 4. NSString：
    1. NSString是以恶数据类型，用来保存oc字符串的
    2. 但其实NSString也是一个类，是Foundation框架中的一个类，用来存储oc字符串的。
    3. 其实完整的标准的创建NSString对象的方式 NSString *str = [NSString string];
       这种方式创建的字符串是空字符串@“”
       但是NSString是我们最常用的一个对象，所以oc使用了一种更为简单的方式创建字符串对象，直接使用@来表示一个oc字符串。
       @“Lexi”本质是一个NSString对象，str的值是这个对象的地址
       %p 打印的是指针变量的值
       %@ 打印的是指针变量指向的对象
    4. 最常用的对象方法
        1. length方法：返回值为NSUInteger, 其实就是unsigned long，得到字符串的个数，可以处理中文
        2. 得到字符串指定下标的字符：characterAtIndex (返回unichar）返回unichar不反回char的原因是unichar占用2个字符，可以放得下中文，如果要输出unichar的值要用%C （char用%c）
        3. 判断两个字符串的内容是否相同
            判断两个字符串的内容是否相同，不要用==去判断，要用isEqualToString
    5. 比较两个字符串的大小 （比ascii码）返回NSComparisonResult (完全可以用int类来接受结果，因为返回值是一个枚举：-1小，0相等，1大于）
 
 5. 匿名对象
    1. 之前创建对象的做法：
        Person *p1 = [Person new];
       让一个指针指向一个对象，这个指针就叫做这个对象的名字
    2. 匿名对象：
        没有名字的对象，如果我们创建一个对象，没有用一个指针存储这个对象的地址，也就是没有任何指针指向这个对象，那么这个对象就叫做匿名对象。
        [Person new]
    3. 如何去使用一个匿名对象：
        [Person new]->_name = @"jack";
        [[Person new] sayHi];
        [Person new]这句代码结果世纪就是创建的对象的指针，那么就可以直接被使用
    4. 注意点：
        a 匿名对象只能使用一次
        b 每次创建匿名对象都是不同的对象
    5. 有什么用？
        a 如果某个对象的成员只会被用一次，用完之后再也不需要，那么可以用匿名对象
        b 如果方法的参数是一个对象，而调用者为这个参数赋值的对象，就是专门来给这个方法传递的并且这个对象调用者不会使用，那么这个时候就可以直接微方法传递一个匿名对象
 
  6. 面向对象的三大特征
        1. 封装
            函数就是一个封装的体现。
            类，是更高级别的封装。类将数据和行为封装为了一个整体。
            *好处 -> 屏蔽内部实现，外界不需要知道内部如何实现，只需要知道这个对象有什么用
                 -> 方便操作。
                 -> 后期维护十分便利。
        2. 继承
        3. 多态
 
 7. setter的封装：
        在为对象的属性赋值的时候，希望对数据做一个逻辑验证，如果在值不在属性范围内就做默认处理。
        不能写@public了，一旦写上public，就意味着外界可以直接访问对象 -> 任意为属性赋值了。
        要为类提供一个方法，这个方法专门给属性赋值，这个方法一定是对象方法，为对象赋值，这个方法没有返回值。
        方法的名字必须叫set属性。方法一定有参数，参数类型和属性类型一致，参数名称和属性名称一致

 8. getter的封装：
        提供一个对象方法，做的事就是取属性的值，名称就叫属性名称（去掉下划线），没有参数。

 9. 什么时候需要为属性封装setter和getter？
    1. 只要属性需要被外界访问，就要为这个属性封装setter和getter，哪怕在赋值的时候不需要任何逻辑验证。（oc规范）
    2. 如果属性只在类的内部访问，那么就不需要为其封装getter和setter
 
10. 只读封装和只写封装：
    1. 只读封装：只提供getter不提供setter
    2. 只写封装：只提供setter不提供getter
 
 11. 对象与对象之间的关系：
        1. 组合关系： 一个计算机由cpu，内存，主板，显卡，声卡，网卡。。。组成，计算机和cpu的关系叫组合关系
        2. 依赖关系：一个对象的方法的参数是另外一个对象，那么他们的关系是依赖关系。人打电话，人类依赖于电话类。
        3. 关联关系：关联体现在两个类之间语义级别有强关联关系。简单来说：一个类作为另一个类的属性，但他们不是组合关系，是拥有关系（人拥有狗）
        4. 继承关系
 
        耦合度：当修改一个对象的时候，对另一个对象的影响程度。（当两个类具有依赖关系）
        低耦合：当修改一个对象的时候，对另一个对象影响较小甚至没有影响。
        高内聚：一个对象仅仅做自己相关的事情。
        单一职责原则：一个类只做自己的事情，别人的事情别人做。

### Day04 - 面向对象：继承与多态
1. xcode文档的安装
    苹果提供了很多很多的框架，框架中有很多类很多函数很多数据类型。
    遇到的问题：
    1. 你如何知道到底有哪些框架
    2. 框架中到底有哪些类
    3. 类中有哪些方法
    4. 如何调用这些方法
 
    所有的这一切，苹果提供xcode文档，详细描述了这些信息。
 
 2. c语言中的static
    1. 可以修护局部变量
    2. 可以修饰全局变量
    3. 可以修饰函数
 
3. oc中的static
    1. 不能修饰属性也不能修饰方法
    2. 可以修饰方法中的局部变量，如果方法中的局部变量被static修饰，这个变量就会被变成静态变量，第一次声明存储在常量区，方法结束后变量也不会被回收，下次再执行这个方法时， 不用声明直接使用。
    3. 如果返回值时当前类对象，用instancetype作为返回值的type
    4. 例子：学生编号，不让外界来指定，而是第一个学生编号为1，每生成一个学生就编号++，就可以把编号变量设置成static放在在constructor里，这样下次调用constructor时编号不会消失且自动++。
 
 4. self关键字: self是一个指针，在对象方法中self指向当前对象，在类方法中self指向当前类
    1. 方法的内部可以定义一个和属性名相同的局部变量，但是容易和属性搞混，如果在方法访问这个同名的变量，访问的是局部变量。所以要用self->_name (如果没有同名局部变量，用不用self结果都一样）
    2. 如何调用其他对象方法？不用创建新的对象，只需要调用当前对象的对象方法，用self
    3. 在类方法中应用self的例子。
        1. 类的加载：当类第一次被访问时，会把类的代码存在代码区，代码区中用来存储类的空间，也有一个地址。
        2. 在类方法中，self也是一个指针， 这个指针指向类在代码段中的地址
        3. 有什么用：可以在类方法中使用self来显式地调用本类的其他类方法，使用建议：如果要调用本类的其他类方法，虽然可以z直接使用，建议通过self
    4. 总结一下取到类在代码段中地址的方式
        1 调试查看对象isa指针的值
        2 在类方法中查看self值
        3 调用对象的对象方法class，就会返回这个对象所属的类在代码段中的地址
        4 调用类方法class，也会返回这个类在代码段中的地址
 
    5. ⚠️注意：
        1. 在对象方法中，self代表当前对象，不能用self调用本类的类方法
        2. 在类方法中，self代表当前的类，不能用self调用本类的对象方法or属性
 
 4. 类方法和对象方法是可以重名的
      1. 对象方法可以声明多次，但只会认为有一次 - 对象方法之间不能重名
      2. 类方法之间也不可以重名
      3. 但是，对象方法和类方法是可以重名的。通过类名调用调用的就是类方法，通过对象来调调的就是对象方法。
 
 5. 继承
    * 目的：子类想拥有父类中所有成员，但是不想定义，而想直接拥有。
    * 语法：@interface 类名 ： 父类名称 (在创建类的时候指定父类会自动生成代码）
    * 效果：子类拥有父类中所有成员和方法，不用自己定义。
    * 应用场景：如果发现另外一个类当中的成员我也想有，就可以使用继承。但是不要乱继承，不要为了继承而继承，只有满足isA关系才可以继承
    * ⚠️注意：如果一个成员不是所有子类都拥有的，就不要定义在父类中，父类中只定义所有子类都拥有的。
           子类中不能存在和父类同名的属性。
 
 6. OC继承的特点
    1. 单根性：只能有一个父类
    2. 传递性：a类从b类继承，b类从c类继承，那么a同时拥有b，c类成员。
    3. NSObject类：是Foundation框架中的类，这个类只有一个方法，new。 new这个方法是用来创建对象的，方法返回值是创建这个对象的指针。如果想让类具备创建对象的能力，就必须继承自NSObject类，我们写的类必须直接或间接的从NSObject继承。（NSObject是oc中所有类的父类）在NSObject类中，还定义了一个属性，属性叫做isa指针，所以每个子类对象都有一个isa指针。isa指向类在代码区的地址。
  
 7. super关键字
    1. 可以用在类方法和对象方法之中。
    2. 在对象方法当中，可以用super关键字来调用从父类继承的对象方法。
    3. super只能用来调用父类对象方法或类方法，不能用来访问属性。
 
 8. 访问修饰符：用来修饰属性。限定对象的属性在哪一段范围内访问
    * @private：只能在本类的内部访问，子类依然可以继承父类的私有属性，但是在子类中无法直接访问从父类继承过来的私有属性，但你还是可以通过调用父类的getter/setter属性来为它赋值
    * @protected：受保护的，只能在本类和本类的子类中访问
    * @package：可以在当前框架中访问
    * @public：公共的，可以在任意地方访问
    * 如果不为属性置顶访问修饰符，默认是@protected
    * 访问修饰符的作用域：作用于一直往下数，直到遇到新的修饰符或者结束大括号为止。
    * 使用建议： 
      1. 无论什么情况下都不要使用public，属性不要直接暴露给外界。
      2. 如果属性只想在本类中使用，不想在子类中使用，用private
      3. 属性只在本类和子类中使用，用protected（default推荐）
      4. 访问修饰符只能用来修饰属性，不能用来修饰方法
      
 10. 私有方法：只写实现，不写声明，就自动变成私有方法，外部不可见。
 
 11. 里氏替换原则（lsp）：子类可以替换父类的位置，且程序的功能不受影响。因为父类中拥有的成员子类都有，不会影响程序性能。
      Person *p = [Student new]
      作用：
        1. 1个指针中不仅可以存储本类对象的地址，还可以存储子类对象的地址。
        2. 如果一个指针的类型是nsobject类型的，这个指针中可以存储任意oc对象的地址。
        3. 如果一个数组的元素的类型是1个oc指针类型，那么这个数组中不仅可以存储本类对象，还可以存储子类对象。
        4. 如果数组元素是nsobject指针类型，意味着任意oc对象地址都可以存在这个数组中。
        5. 如果一个方法的参数是一个对象，那么我们在为这个参数传值的时候，可以传递本类对象，也可以传递子类对象。
        6. ⚠️重要：当一个父类指针指向一个子类对象的时候，通过这个父类指针只能去调用子类对象的父类成员，子类独有的成员无法访问。
 11. 方法的重写:
        1. 子类继承了父类的方法，但是有时子类的行为具体实现和父类不一样，那就重写。
        2. 直接在类的实现中将这个方法重新实现一遍就可以了（不实现就默认用父类的实现）。
        3. 当一个父类指针指向一个子类对象的时候，通过这个父类指针调用的方法，如果子类对象中重写了方法，调用的就是子类重写后的方法。
 
 12. 多态：指的是1个 行为，对于不同事物具有完全不同的表现形式，同一行为具有多种形态。
 13. Description:
      * %p 打印指针变量的值
      * %@ 打印指针指向的对象：输出的格式是<类名： 对象的地址>
      * %@的实现原理：
        1. 调用传入对象的description方法 （是NSObject定义的方法）
        2. 拿到方法返回值（一个字符串），将字符串输出
        3. 重写description方法：（相当于overiride java类的tostring方法）

### Day05 - 一些底层原理
1. 创建一个对象，对象的内存如何分配
    1. 子类对象又自己的属性和父类的属性
    2. 代码段中的每一个类都有一个isa指针，这个指针指向它的父类，一直指到NSObject. 如果调用父类的对象/方法，回根据isa指针找父类，如果有就执行，没有就接着根据isa找父类，一直找到这个方法为止。
 
 2. 结构体和类的区别，如何选择？
    1. 相同点：都可以将多个数据封装为一个整体。
    2. 不同点：结构体只能封装数据，类还可以封装行为（方法）| 结构体在栈空间，类在堆空间
    3. 应用场景：
        1. 如果表示的实体，不仅由多个数据组成，这个是实体还有行为，用类
        2. 栈的特点：空间相对较小，但是存储在栈中的数据访问效率更高
           堆的提点：空间相对较大，但是存储在堆中的数据访问效率较低
        3. 如果表示的实体没有行为，光有属性，如果属性不多（2-5），可以用结构体来提高效率，如果属性太多，用类
    4. 赋值
        结构体：Student
        类：Person
        Student s1 = {"jack", 19, GenderMale};
        Student s2 = s1; //值赋值
 
        Person *p1 = [Person new];
        Person *p2 = p1; //指针赋值
 
 3. 类的本质
    1. 内存中的五大区域：
        * 栈：局部变量
        * 堆：oc对象，和用realoc，caloc，maloc自己申请的空间的
        * bss段：存储未初始化的全局变量和静态变量。
        * 数据段：常量
        * 代码段：用来存储代码的
 
        * 类加载：当类第一次被访问的时候，这个类就会被加载到代码段存储起来。
    2. 讨论三个问题
        1. 类什么时候加载到代码段？
           * 类第一次被访问的时候。
        2. 类以什么样的形式存储在代码段?
           * 任何存储在内存中的数据都有一个数据类型。（int/float/char）任何在内存中申请的空间也有自己的类型。
        3. 在代码段存储类的那块空间是什么类型的：
            * 先在代码段中创造一个class对象，class是foundation框架中的一个类cls-，这个class对象就是用来存储类信息的。（至少有3个属性；类名/类的属性们/类的方法们）
            * 将类的信息存储在一个class对象之中
            * 所以类是以class对象的形式存储在代码段的，存储类的这个class 对象，我们也叫做类对象，用来存储类的一个对象。所以class对象里面会有isa指针，这个指针指向存储父类的类对象。
        4. 类一旦被加载到代码段之后，什么时候回收
            类一旦被加载到代码段后是不会被回收的，除非程序退出。
 
 4. 类对象的使用：
    1. 如何拿到存储在代码段的类对象：
        1. 调用类的方法class （[Person class])，就可以拿到存储person类的类对象。
        2. 调用对象方法的class（Person *p = [Person new]; [p class])
        3. 对象中的isa指针的值其实就是代码段中存储类的类对象的地址
           ⚠️注意：声明class指针的时候不需要加✳️，因为在typedef的时候已经加了✳️了。
    2. 拿类对象有什么用：
        1. 类对象就等价于类本身。类对象等价于本身，所以可以用类对象来调用类方法，类能做的事类对象也能做。
        2. 可以使用类对象，来调用new方法，创建存储在类对象中的类的对象
 
 5. SEL: selector选择器
    * 它是一个数据类型，所以要在内存中申请空间存储数据
    * SEL其实是一个类，SEL对象是用来存储一个方法的
    * 类是以class对象的形式存储在代码段之中的：
      * 类名：NSString
      * 属性：
      * 方法：方法是以SEL对象存储起来的，每个SEL对象就是一个方法（类似一个数组存储所有方法）
            1. 先创建一个SEL对象
            2. 将方法的信息存储在SEL对象中
            3. 再将SEL对象作为类对象的属性存储起来
    * 拿到存储方法的SEL对象？
        1. 因为SEL是一个typedef类型的，在自定义的时候已经加了✳️了，所以我们在声明SEL指针的时候，不需要加✳️。
            SEL s1 = @selector(sayHi);
 
 6. 调用方法的本质（内部原理）[p1 sayHi];
    1. 先拿到存储sayHi方法的SEL对象，拿到SEL数据，SEL消息。
    2. 将这个SEL消息发给p1对象。
    3. 这个时候，p1对象接受到消息后，知道要调用方法
    4. 根据对象的isa指针找到存储类的类对象
    5. 找到这个类对象以后，在这个类对象中去搜寻是否有和传入SEL数据相匹配的，如果有就执行，没有就再找父类，直到找到NSObject.
    OC最重要的机制：消息机制 -> 调用方法的本质其实就是为对象发送SEL消息。
    6. 手动为对象发送sel数据？
        1. 先得到方法的sel数据
        2. 用performSelector方法手动把sel数据发送给对象：
           SEL s1 = @selector(sayHi);
           [p1 performSelector:s1]; 与[p1 sayHi]是一样的。
    7. 注意事项：如果方法有参数，方法名带有冒号
             如果方法有参数，用performSelector withObject方法来把参数也传进去。
 
6. 点语法：
    * java，c#等对象可以使用点语法访问对象的成员
    * oc也可以使用点语法来访问对象的属性，但是本质完全不同。
    * oc对象如果要为对象赋值取值，要调用对应的getter/setter，使用点语法访问对象属性：
        对象名.去掉下划线的属性名。
        p1.name = @"Lexi";
        NSString *name = p1.name;
    * 点语法的原理：
        1. p1.age = 19; 这句话的本质并不是把19直接赋给_age属性，点语法回再编译器编译的时候，将点语法转换为调用getter和setter代码。
        2. ⚠️这个原理和java完全不同，因为p1.name == [p1 setName], 所以如果在setter里面这么写: self.name = name, 会产生死循环因为它会转换为[self setName]开始自己调用自己。这和java是完全不同的。
        3. 又因为点语法会转换为getter/setter，所以如果某属性没有实现getter/setter，点语法完全无效。
 7. @property
    * 写一个类需要先声明属性再声明属性的getter/setter再实现，非常tedious。
    * property关键字可以自动的生成getter/setter的声明，然后编译器在编译的时候，会根据@property再生成getter/setter的实现。
    * 语法：@property 数据类型 数据名称（数据名称去掉下划线！ 写在方法声明中） property只能生成声明，实现还得自己来，属性也得自己写。
 
 8. @synthesize
    * @property只能生成getter和setter的声明，实现还得自己来
    * 方法实现的代码也可以自动生成。@synthesize写在implementation中
      * 写法: 
              @synthesize age；
              @synthesize setAge;
      * 效果：
        1. 生成一个真私有的属性，属性的类型和@synthesize对应的@property类型益智，属性名字和@synthesize对应的@property名字一致。
        2. 自动生成setter方法的实现。
    * 组合：点语法+property+synthesize可以简化属性的声明/getter/setter，组合以后，可以不用在interface声明属性了。
    * 特殊要求：希望@synthesize不要自动生成私有属性？
      * 语法：@synthesize age = _age ->不会再去生成私有属性，直接生成getter/setter的实现。
    * 注意：
        1. 如果直接写一个@synthesize，会自动生成私有属性+setter+getter
        2. 如果@synthesize age = _age ->不会再去生成私有属性，直接生成getter/setter的实现
        3. 生成的setter方法实现中没有任何逻辑验证，直接赋值，如果要做逻辑验证，要自己在类的实现中重写setter。
        4. 批量声明？
```
        @property float height, weight; (类型一致的可以批量声明）
        @synthesize height, weight, age, name; (类型不一致也可以放在一起批量声明）
        @synthesize height=_height, weight=_weight, age=_age, name=_name;
```
10. @property的增强：
    * @synthesize+property是xcode4.4之前的写法， 之后xcode做了一个property增强，只需要写一个property，编译器就会自动的
      1. 生成私有属性
      2. 生成 getter/setter的声明
      3. 生成 getter/setter的实现
    * 使用注意：
      1. 增强后的property也可以批量声明相同类型的property！
      2. 但property生成的setter没有做逻辑验证，要做就重写setter方法。
      3. ⚠️如果同时重写getter和setter，就不会自动生成私有属性了！需要自己声明这个属性（做全套）
 
 11. 动态类型 / 静态类型
      1. oc是一门弱语言。弱语言指的是，编译器在编译的时候，检查没有那么严格。
      2. 静态类型：指的是一个指针指向的对象是一个本类对象。
      3. 动态类型：指的是一个指针指向的对象不是本类对象。
      4. 编译检查：编译器在编译的时候，能不能通过一个指针去调用指针指向的对象的方法。（判断原则：看指针所属的类型之中有没有这个方法，如果有就认为可以调用，编译通过，否则编译报错）在编译的时候，能不能调用对象的方法主要看指针的类型。我们可以将指针的类型进行强转换来达到骗过编译器的效果。（实际上任意指针可以指向任意对象，编译器都不会报错，所有类型的指针都是8个字节）
      5. 运行检查：运行时会去检查对象中是否真的有这个方法，如果有则执行否则报错。
 
 11. NSObject：是所有类的基类，NSObject指针可以指向任意的oc对象。所以NSObject指针是一个万能指针，可以指向任意的oc对象。
            但如果要调用指向的子类对象独有的方法，就必须做类型转换。
 12. id指针：也是万能指针，可以指向任意的oc对象。
      1. id是一个typedef自定义类型，定义的时候已经加了*，声明时就不用写*了
      2. 万能指针，任意对象都能指，和NSObject一样，不同点在于：在编译时，通过NSObject指针调用对象的方法的时候，编译器会做编译检查，用id类型指针调用则不会检查，编译器直接通过。
      3. 注意：id指针不能使用点语法，它只能调用方法不能调用属性。如果我们要声明万能指针，prefer声明id指针rather than nsobject
 
 13. instancetype：代表当前方法返回值是当前类的对象。但注意intancetype只能作为方法的返回值，不能在别的地方使用。instancetype是一个有类型的代表当前类的对象。id是一个无类型的指针，仅仅是一个地址。
 
 15. 苹果的编译器叫：LLVM
    编译器很好被骗过因为编译器之判断指针的类型，就算编译通过也不意味可以完美执行。
    怎么保证一个函数一定能被一个类对象执行：
        1. repsonseToSelector方法 （最常用）
        2. isKindOfClass方法：判断指定对象是否为指定类或其子类对象。
        3. isMemberOfClass方法：只判断指定对象是否为指定类的对象（不判断子类对象）。
        4. isSubclassOfClass方法：判断是否是子类对象
        5. instancesRespondToSelector: 判断类里面有没有类方法（所以参数是类）。
 
 15. 构造方法：
      1. [类名 new] -> new方法的内部是先调用alloc方法，在调用init方法。alloc方法是一个类方法，作用：哪个类调用这个方法，就创建哪个类的对象，并把对象返回。init方法是一个对象方法，作用：初始化一个对象。创建对象的完整步骤：1. alloc创建对象，2. init初始化对象。虽然没有初始化的对象有的时候也可以使用，但是千万不要这么做，使用未初始化的对象是非常危险的。
    [Person new] == [[Person alloc] init];
      2. init方法
          * 作用：初始化对象，为对象的属性赋初始值，这个init方法叫做构造方法。
              * 如果属性的类型是基本数据类型，就赋值为0
              * 如果属性的类型是c指针，就赋值为NULL
              * 如果属性的类型是oc指针，就赋值为nil
      3. 重写init方法
          * 作用：自定义初始化的方法->按自己的方式给对象属性赋值。
          * 重写init方法的规范：
              * 必须先调用父类的init方法，再将方法的返回值赋值为self。
              * 调用init方法初始化对象有可能会失败，如果初始化失败，返回的就是nil。
              * 判断父类是否初始化成功 （if self != nil)，如果不为nil，说明初始化成功，再进一步赋值。
              * 返回self
          * 解惑：
              * 为什么调用父类init方法？因为父类的init方法会初始化父类的属性，必须保证当前对象中的父类属性也被初始化。
            ```
            - (instancetype) init {
                self = [super init];
                if (self) {
                    xxxx
                }
                return self;
            }
            ```
          * 创建对象的时候的属性值让创建对象的人来制定？自定义构造方法（带参数）
            * 规范：
                1. 自定义构造方法的返回值必须是instancetype
                2. 自定义构造方法的名称必须以initWith开头
                3. 方法实现和init的要求一样
            * 实例：详见“构造方法” target
 
 ### Day 06 - oc内存管理（MRC - Manual Reference Counting)
 1. 内存管理
    1. 内存的作用 - 存储数据
    2. 如何将数据存储到内存之中 - 声明一个变量，然后将这个数据存储进去
    3. 当数据不再被使用的时候，占用的内存空间如何被释放
       * 内存中的五大区域：
          * 栈：局部变量，当局部变量的作用域被执行完毕后，局部变量就会被系统立即回收。（系统自动完成）
          * 堆：OC对象，使用c函数申请的动态空间
          * BSS段：未初始化的全局变量，静态变量。一旦初始化，就回收，并转存在数据段 （系统自动完成）
          * 数据段：已经初始化的全局变量和静态变量，直到程序结束才会被回收（系统自动完成）
          * 代码段：代码，程序结束的时候系统才会自动回收代码段中的数据（系统自动完成）
    4. 栈，bss段，数据段，代码段的数据回收由系统自动完成，不需要我们干预。 但是分配在堆区中的oc对象是肯定需要回收的。【iphone 内存机制】如果内存占用超过40m就会发出警告。45m再次发出警告，120m直接闪退。
    5. 如何回收堆中的oc对象？
        * 存储在堆中的oc对象系统不会自动回收，直到程序结束才会被回收。如果我们在程序结束前就回收，我们需要自己来回收堆中的oc对象。
        * 我们只需要管理存储在堆中oc对象的回收。
        * oc对象应该什么时候回收？用完就回收（没有任何人使用的情况下）！
    6. 如何知道有没有在用这个对象了呢：引入计数器
       * 每个对象都有一个属性叫做retainCount，叫做引用计数器，类型是unsigned long （8个字节）
       * 作用：用来记录目前有多少人在使用该对象。（默认值是1）
       * 操作：
          * 当多一个人使用该对象时，应该先让这个对象的引用计数器的值+1，代表这个对象多一个人使用
          * 当这个对象少一个人使用的时候，应该先让这个对象的引用计数器的值-1。
          * 当引用计数器变为0的时候，代表这个对象无人使用，这个时候系统就会自动回收这个对象了。
       * 具体操作：
            1. 为对象放一条retain消息，对象的引用计数器就会+1
            2. 为对象放松一条release消息，对象的引用计数器就会-1。
            3. 为对象发送一条retainCount消息，就可以得到对象引入计数器的值
            4. ++-- 当对象引用计数器变为0的时候，对象就会被系统立即回收，在对象被回收时，会自动调用对象的dealloc的方法。
 
 2. 内存管理的分类
    * MRC: Manual Reference Counting 手动引用计数，手动内存管理。 即当多一个人使用对象，要求程序员手动发送retain消息，少一个要手动发送release消息
    * ARC: Automatic Reference Counting 自动引用计数，自动内存管理。 系统自动在合适的地方发送retain release消息。
    * 学习MRC的理由：
        1. 面试必考 100%
        2. 在2011年ios5之前，没有arc的存在，早期的app开发都用的是mrc技术。
        3. ios大牛都是从mrc成长起来的（比arc更精确）
        4. arc是基于mrc的，如果想搞明白arc的底层原理，mrc必须搞懂。
 
 3. MRC
    1. 目前的xcode是默认支持arc开发，默认开发方式是arc，需要关闭arc开启mrc。
    2. 实例见MRC target
 
 4. 内存管理的重点
    a 什么时候为对象发送retain消息
    b 什么时候为对象发送release消息
 
 5. 内存管理的原则
    1.  arc机制下，retain，release，dealloc这些方法都无法调用
    2. 有对象的创建，就要匹配一个release
    3. retain的次数和release的次数要匹配。
    4. 谁用谁retain，谁不用谁release，有始有终有加有减，一定要平衡。
 
 6. 野指针和僵尸变量：
    1. 在c语言中的野指针：定义一个指针变量却没有初始化。
    2. 在oc中的野指针：指针指向的对象已经被回收了。
    3. 🧟‍♀️ 僵尸对象：
        申请一个变量，实际上是向系统申请指定字节数的空间，这些空间系统就不会再分配给别人了，当变量被回收的时候，代表变量占用的字节空间从此以后系统可以分配给别人使用。但是字节空间中存储的数据还在，当对象占用的空间没有分配给别人之前，其实对象数据还在，我还是能访问这个数据，调用对象方法。这个对象就叫做僵尸对象。
    4. 当我们用野指针访问僵尸对象时，有可能有问题，也有可能没问题，当且仅当僵尸对象占用的空间没有分配给别人使用的时候，野指针就还能访问此僵尸对象，如果已经分配给别人，就会报错。
    5. 但我们认为，只要一个对象成为了僵尸对象，无论如何都不该允许访问了。所以希望如果访问的是僵尸对象，无论如何报错。 -> 僵尸对象的实时检查机制，可将此机制打开，打开后，只要访问的是僵尸对象，无论空间是否分配都会报错。
    6. 为什么不default打开僵尸对象检测呢？
        因为一旦打开检测，每访问一个对象的时候，都会先检查这个对象是不是一个僵尸对象，及其消耗性能。所以做测试的时候可以打开，平时一般不打开。
    7. 如何不打开僵尸对象检测且避免僵尸对象错误：当一个指针变成野指针后，将这个指针的值指向nil。当一个指针为nil时，通过这个指针调用对象的方法时（包括点语法），不会报错，也不会有任何反应。但是如果通过指针直接访问属性就会报错。
    8. 无法复活一个僵尸对象！！！（不要在release了对象以后再retain）
 
 7. 内存泄漏
    * 指的是一个对象没有被及时回收，在该回收的时候没有回收，一直驻留在内存中，直到程序结束才回收
    * 单个对象的内存泄漏情况：
        1. 有对象的创建，没有对应的release
        2. retain次数和release次数不匹配
        3. 在不适当的时候，为指针赋值为nil
        4. 在方法中为传入的对象进行不适当的retain
    * 如果保证单个对象可以被回收
        1. 有对象的创建就要匹配一个release
        2. retain的次数和release次数要匹配
        3. 只有指针为野指针的时候才赋值为nil
        4. 在方法中不要随意为传入的对象retain
    * 当为对象的属性多次赋值的时候，如果不release旧对象，就会发生内存泄漏，应该release旧的，retain新的。
    当为对象属性多次赋值的时候，如果新旧对象是同一个对象，还release的话，就会出现内存泄漏。当发现新旧对象是一个对象的时候，什么都不用做。当新旧对象不是一个对象时才release旧的retain新的
 
 8. 完美版的setter写法：
 ```
    -(void)setCar:(Car *)car
    {
        if (_car != car) //说明新旧对象不是一个对象
        {
            [_car release];
            [car retain];
        }
        _car = car;
    }
     - (void) dealloc
     {
         NSLog(@"人死掉了。。。");
         //因为人死掉了，所以意味着少一个人使用他所拥有的车了,所以要为这个车发送release消息。
         [_car release];
         [super dealloc];
     }
  ```
 
 9. 注意：我们管理的范围是oc对象，只有属性的类型是oc对象的时候，setter的方法才应该像上面这样写，如果不是oc对象（基本数据类型）直接赋值即可。
 
 10. 在MRC开发模式下，1个类的属性如果是1个oc对象类型的，那么这个属性的setter方法就应该按照上面的格式写（还要重写dealloc方法）如果属性类型不是oc对象类型，什么也不用做。
 
 11. @property
  * 作用：
      1. 自动生成私有属性
      2. 自动生成这个属性的getter setter方法声明
      3. 自动生成这个属性的getter setter方法的实现。在生成的setter方法的实现中，无论是什么类型的都直接赋值。
  * 带参数的property
      1. @property(参数1，参数2，参数3。。。）数据类型 名称；
      2. @property的四组参数
          1. 与多线程相关的两个参数：atomic / nonatomic（默认atomic）
              * atomic：会把生成的setter方法加线程安全锁->线程安全but效率较低
              * nonatomic：无线程安全锁，不安全但效率高，建议选择nonatomic来提高效率。
 
          2. 与生成的setter方法的实现相关的参数：assign，retain（默认assign）
              * assign：生成的setter方法实现就是直接赋值
              * retain：生成的setter方法的实现就是标准的mrc内存管理代码（先判断新旧对象是否为同一对象，如果不是就release旧的retain新的）。
              * 建议：如果属性类型是oc对象，就用retain！如果不是就默认assign。
              * 千万注意：retain参数只是生成标准的setter方法为标准的mrc内存管理代码，不会自动在dealloc中release，我们还是要自己手动在dealloc中release。
 
          3. 与生成只读，读写相关的参数：readonly，readwrite（默认readwrite）
              * readwrite：同时生成getter，setter。
              * readonly：只生成getter。
          4. 与生成getter，setter方法名字相关的参数：getter/setter
              * 默认情况下，@property生成的getter/setter方法名字都是最标准的名字，其实我们可以自定义getter/setter名字。
              * getter：getter=xxx，getter的名字变成xxx
              * setter：setter=zzz，setter的名字变成zzz，注意setter是有参数的要加冒号。
              * 注意：如果用getter和setter改变了名字，点语法依旧有效。（编译器也自动跟着转换）建议还是别改【无论什么情况都别生成setter方法的名字，默认情况生成的名字就是最标准的了】BOOL类型的属性在某些情况下可以改getter名字来增加阅读性。
 
 12. @class
  * 当两个类相互引用相互包含的时候，会陷入循环引用 -> 无限递归，无法编译通过。
  * 解决方案：不要用import "Book.h"，用@class Book。其中一边不要用#import引入对方的头文件，而使用@class 类名，来标注这是一个类，这样可以在不引用对方头文件的情况下，告诉编译器是一个类。
    @class和#import的区别：
    1. import是将头文件的内容拷贝到写指令的地方
    2. @class不会拷贝任何内容，只是告诉编译器这是一个类。
    3. 在m文件中再#import头文件就可以使用了（不引用只是不会提示该方法，但也是可以使用的）
 
 13. 循环retain
  * 当两个对象相互引用的时候：a对象的属性是b对象，b对象的属性是a对象，如果两边都使用retain，就会发生内存泄漏。
  * 解决方法：只有一边用retain，另一边用assign。

### Day 07
#### __1. 自动释放池__
> 存入到自动释放池的对象，在自动释放池中被销毁的时候，会自动调用存储在该释放池中所有对象的release方法。 
- 解决的问题： 将创建的对象放在自动释放池中，就不再需要手动release这个对象了，因为池子被销毁的时候，会自动调用池中所有对象的release。
- 如何创建自动释放池：
    ```
    @autoreleasepool
    {
    }
    ```
- 如何将对象存储在自动释放池中：
在调用释放池中调用对象的autorelease方法，就会将这个对象存入当前自动释放池中。autorelease方法返回的是对象本身，于是可以这么写：
    ```
    @autoreleasepool
    {
        Person *p1 = [[[Person alloc] init] autorelease];
    }
    ```
    此时自动释放池执行完毕后后立即为池中对象发送一条release消息。注意，不一定是销毁了对象，只是发送了一条release消息。
- 自动释放池使用注意：
    - 必须记住要调用对象的autorelease方法，如果只是把对象创建在大括号中是没用的。
    - 对象的创建可以写在大括号外面，但是调用autorelease方法的时候要在大括号里面。
    - 当自动释放池结束的时候，仅仅是为各对象发送一个release消息，并不是把对象销毁了。
    - 如果在相同的自动释放池中调用一个对象的autorelease方法n次，这个对象就会在池子中存储n次，当池子被销毁时，就会对对象发送多条releaes消息，此时会出现僵尸对象错误。所以一个自动释放池中一个对象应只调用autorelease方法一次。
    - 将对象存储在自动释放池中，并不会对对象的引入计数器+1。
    - 自动释放池可以嵌套：
    ```
    @autoreleasepool
    {
        Person *p = [[[Person alloc] init] autorelease];
        @autoreleasepool 
        {
            Person *p2 = [[[Person alloc] init] autorelease];
        }
    }
    ```
    - 自动释放池的唯一作用：省略创建对象的那个release。

#### __2. 类方法的规范__
- 一般情况下，要求提供一个与自定义构造方法相同功能的类方法，可以快速创建一个对象。
- 一般情况下，写一个类要求为类提供一个同名类方法（不带参数），来让外界快速得到一个对象。[重要⚠️： 使用类方法得到的对象，要求这个对象一定要被autorelease过了！！！使用对象方法创建对象不需要autorelease（这是规范）]
    ```
    - (instancetype) initWithName: (NSString *)name andAge: (int)age andWeight: (float)weight
    {
        if (self = [super init])
        {
            self.name = name;
            self.age = age;
            self.weight = weight;
        }
        return self;
    }

    + (instancetype) pig
    {
        return [[[self alloc] init] autorelease];
    }

    + (instancetype) pigWithName: (NSString *)name andAge: (int)age andWeight: (float)weight
    {
        return [[[self alloc] initWithName:name andAge:age andWeight:weight] autorelease];
    }
    ```

#### __3. 微博练习__
> 要求：在MRC的模式下，设计以下构成微博所需要的类 
>> 1. 微博类 （Microblog)
>>  * 文字内容：图片/发表时间/作者/被转发的微博/评论数/转发数/点赞数
>> 2. 作者类 （User)
>> * 名称/生日/账号
>> 3. 账号类（Account)
>> * （账号名称/账号密码/账号注册时间）

----
结构体和类的区别（再复习）
1. 结构体只能封装属性，而类不仅可以封装属性还可以封装方法（只要一个数据既有属性又有行为，只能用类）
2. 结构体变量分配在栈，oc对象分配在堆
    * 栈的空间相对较小，但是存储在栈中数据访问效率较高。
    * 堆的空间相对较大，但是存储在堆中数据访问效率较低。
    * 结构体赋值是直接赋值，对象是指针，赋值的是对象的地址。
3. 注意：
    - 如果数据只有属性无行为，封装成类效率会低
    - 如果数据只有属性无行为，但是有太多属性，结构体变量会在栈中占据很大空间，效率反而变低。
    - 什么时候使用结构体：
        - 只有属性无行为。
        - 属性较少 （3个以下）
----

#### __3. ARC__
> Automatic Reference Counting,自动引用计数。顾名思义，系统自动帮助我们去计算对象的引用计数器的值。可以说是WWDC2011 he ios5引入的最大的变革和最激动人心的变化。ARC是新的LLVM3.0编译器的一项特性，一句解决了广大ios开发者锁憎恨的手动管理内存的麻烦。

> 在程序中使用ARC非常简单，只需要像往常一样写代码，但是永远不要写retain，release，autorelease这三个关键字，这是arc的最基本原则。当arc开启的时候，编译器会自动在合适的地方插入retain，release，autorelease代码，编译器自动为对象引用计数，作为开发者，完全不需要担心编译器会做错。

1. ARC机制下，对象如何释放
    - 本质：对象的引用计数器为0的时候，自动释放
    - 表象：只要没有强指针指向这个对象，对象就会被立即回收。
2. 强指针和弱指针
    - 强指针：默认情况下，我们声明一个指针，这个指针就是强指针，我们也可以使用__strong来显式声明这是一个强指针。
    - 弱指针：__weak声明的指针就是弱指针。(__weak Person *p)
    - 如何控制property生成的私有属性是强类型还是弱类型
        - 使用参数，strong和weak
        - @property(nonatomic, strong) Car *car;
        - @property(nonatomic, weak) Car *car;

> 无论是强指针还是弱指针，都是指针，都用来存储地址，都可以通过地址访问对象的成员，唯一的区别是在arc模式下他们用来作为回收对象的基准。
3. 确认程序是否开启arc机制
    - 默认xcode开启arc机制
    - arc机制下，不许调用retain，release，autorelease，[super delloc]
4. 使用建议：
    - 在arc机制下，如果属性类型是oc对象类型，绝大多数场景下使用strong
    - 在arc机制下，如果属性类型不是oc对象类型，用assign
    - 在arc机制下，将MRC下的retain换成strong就行。
5. ARC机制下的循环引用
> 比如有两个类Person和Book，Person可以有Book, Book里面可以有Person。如果两个都是强指针，将出现循环引用的问题
- 解决方法：把其中一个设成weak，另一个用strong。

#### __4. property参数总结__
1. 与多线程相关的参数 （arc/mrc都支持）
    - atomic：默认，安全，效率底下
    - nonatomic：不安全，效率高。
2. retain：（只有mrc支持）
    - 代表生成的setter是标准的内存管理代码，当属性的类型是oc对象的时候，绝大多数使用retain，只有出现循环引用的，一边用retain，一边用assign。
3. assign：（arc/mrc都支持）
    - 当属性的类型是非oc对象，用assign
4. strong/weak：（只有arc支持）
    - 当属性是oc对象类型时，绝大多数使用strong，只有出现循环引用时，一端strong一端weak。
5. readonly/readwrite（arc/mrc都支持）
    - readonly只生成getter
6. setter/getter（arc/mrc都支持）
    - 用来修改setter/getter的方法名。

#### __5. ARC/MRC可能遇到的问题__
> - 问题：程序使用的是arc开发的，但是某些类是使用mrc
> - 解决方案：
>   - 对该类使用命令 -fno-objc-arc
>   - 将MRC转换为ARC:
xcode选择edit -> convert -> To Objective-C ARC
之后会生成修改后的预览，点击确定将代码转换为ARC。
但是xcode只是把retain转换成strong，有很大的可能性出错，且不提供arc->mrc的转换，一但转换无法复原。

#### __6. 分类/类别/类目（category）__
> 一个类中可以有很多方法，将这些方法都写在一个类模块中当然是可以的，但是会臃肿不好维护和管理。默认情况下一个类独占一个模块，难以维护管理，可以让一个类占多个模块，将功能相似的方法定义在同一个模块中，这样的好处：后期方便维护和管理 -> 分类可以做到
- 分类：把类分开，将一个类分成多个模块。
- 如何为一个类添加分类：new objective-c file -> "FileType": Category -> "Class": targetClass.会生成一个h和m文件。
    - 模块文件名：本类名+分类名
    - 声明和实现：@interface 本类名（分类名） / @implementation 本类名（分类名） 
    - 分类的使用：如果要访问分类中定义的池曾有就要把分类的头文件引进来。
    - 分类的作用：将一个类分为多个模块。
    - 什么时候使用分类：
        - 当一个类的方法很多很杂的时候。
        - 为一个已经存在的类添加方法（非正式协议）
    - ⚠️使用注意：
        - 分类中只能增加方法，不许增加属性。
        - 在分类中可以写@property，但是并不会生成私有属性，也不会有此属性getter/setter的具体实现，只会生成getter/setter的声明
        - 在分类的方法实现中不可以直接访问本类的真私有属性（定义在本类的@implementation中），但是依旧可以通过getter和setter来访问这个属性。
        - 当分类中有和本类中同名的方法时，优先调用分类中的方法，哪怕没有引入分类的头文件，如果多个分类中有相同的方法，优先调用最后编译的分类。

#### __7. 非正式协议__
> 为系统自带的类写分类就叫非正式协议。
比如可以为NSObject写一个分类，就相当于给系统自带的类NSObject多写了几个方法。此时所有类都会自带这些方法（因为所有类的基类都是NSObject）

#### __8. 问题总结__
1. ARC机制和java的垃圾回收机制（GC）的区别？
    - GC: java程序在运行期间，垃圾回收器不断扫描堆中对象是否无人使用
    - ARC: 不是运行时，是编译时就在合适的地方插入retain。插入的代码足以在对象无人使用的时候让引用计数器为0 -> 马上销毁（效率更高）
    
### Day09 - Foundation框架
- 框架：系统或者第三方事先写好的一些常用功能的类，这些类的集合叫做框架，框架中有很多功能相似的类。
- Foundation框架：是一个包，有很多类，函数，定义了一些数据类型，这个框架中的类都是最基础的类，其他框架都是基于Foundation框架的。
- Foundation框架中最常用的类
    - NSString
        - 恒定性：
            - 当我们使用简要的创建字符串对象的时候，这个字符串对象是存储在常量区（数据段）的: NSString *str = @"jack";
            - 当我们调用NSString的类方法创建对象的时候，字符串对象存在堆: NSString *str = [NSString stringWithFormat:@"jack"]; NSString *str1 = [NSString new];
            - 当在内存中创建一个字符串对象以后，字符串对象的内容就无法更改了。（指针可以指向别的字符串， 当我们重新为字符串指针初始化的时候，并不是修改原来的字符串，而是创建新的字符串对象。）
            - 当系统准备要在内存中创建字符串对象的时候，会先检查内存中是否有相同内容的字符串对象。如果有直接指向，如果没有才会重新创建 （好厉害。。。）
            - 存储在常量区的数据不会被回收，存储在常量区的字符串也不会被回收
                ```
                NSString *str1 - @"jack";
                str1 = nil; //执行完这一步后“jack”并没有被回收，因为它存在常量区
                NSString *str2 = @"jack"; //所以str2还是会指向第一个“jack”的地址，此时str1和str2的地址是一样的。
                ```
        - 常用方法：
            - 拼接的方式创建1个NSString对象 (NSStringstringWithFormat)
                ```
                NSString *str = [NSString stringWithFormat:@"Hello, my name is %@, I am %d years old." name, age];
                ```
            - 得到字符串的长度[readonly] (@property(readonly) NSUInteger length;)
                ```
                NSULength len = newStr.length;
                ```
            - 得到字符串中指定下标的字符（ -(unichar)characterAtIndex:(NSUInteger)index;) 返回值是unichar类型，要打印用%C
            - 判断两个字符串的内容是否相同 
                - 能否使用 == （当然不能，因为==比较的是左右两边的数据是否相同，如果是两个指针变量那就比较的是地址是否相同，我们要比的是两个字符串指针指向的字符串内容是否一致）
                - 用isEqualToString
                    ```
                    [str1 isEqualToString:str2]
                    ```
        - 将字符串内存写入到磁盘上的某1个文件之中
            ```
                NSString *str = @"Hello";
                NSError *err;
                [str writeToFile:@"/Users/chenxli/Desktop/hello.txt" atomically:NO encoding:NSUTF8StringEncoding error:&err];
                if (err != nil)
                {
                    NSLog(@"%@", err.localizedDescription);
                }
                else
                {
                    NSLog(@"Success");
                }
            ```
            - 参数1: 写入文件的路径
            - 参数2：是否写入临时文件里？if yes，先写入临时文件，成功才写入指定文件（安全，效率低），if no，直接将内容写入指定文件（不安全，效率高）
            - 参数3: 指定写入时指定的编码，一般是NSUTF8StringEncoding （utf8）
            - 参数4: 二级指针，要传递一个ESError指针的地址
                - 如果写入成功，这个指针就是nil
                - 如果写入失败，这个指针就会指向一个错误对象，这个对象描述了发生错误的信息，所以要判断是否写入成功也可以判断这个参数是否是nil，也可以得到错误的简要信息(err.localizedDescription)。
            - 返回值：BOOL，代表是否写入成功。 
        - 从磁盘中的文件读取字符串
            ```
            NSError *err2;
            NSString *readStr = [NSString stringWithContentsOfFile:@"/Users/chenxli/Desktop/hello.txt" encoding:NSUTF8StringEncoding error:&err2];
            if (err2 != nil)
            {
                NSLog(@"%@", err2.localizedDescription);
            }
            else
            {
                NSLog(@"Success Read: %@.", readStr);
            }
            ```
            - 参数1: 文件的路径
            - 参数2: 编码
            - 参数3: 错误对象
            - 返回值: BOOL
        - 使用URL来读写字符串数据
            - 优势： 既可以读写本地磁盘文件，也可以读写网页文件，ftp，等等
            - 不同类型的url地址写法：
                - 本地磁盘文件：file:///Users/chenxli/Desktop/hello.txt
                - 网页地址：http://www.itcast.cn/index.html
                - ftp文件地址：ftp://server.itcast.cn/1.txt
            - 写：先将不同类型的地址信息包装在一个NSURL对象中, 再调用stringWithContentsOfURL方法
                ```
                NSURL *u1 = [NSURL URLWithString:@"http://www.itcast.cn"];
                NSString *html = [NSString stringWithContentsOfURL:u1 encoding:NSUTF8StringEncoding error:nil];
                NSLog(@"%@", html);
                ```
            - 读：writeToURL
        
        - 字符串比较：
            - compare方法：- (NSComparisonResult)compare:(NSString *)string;
            ```objective-c
            NSString *str1 = @"Lexi";
            NSString *str2 = @"Jack";
            NSComparisonResult compareRes = [str1 compare:str2];
            switch (compareRes) {
                case NSOrderedAscending:
                    NSLog(@"%@ is smaller than %@", str1, str2);
                    break;
                case NSOrderedSame:
                    NSLog(@"%@ is same as %@", str1, str2);
                case NSOrderedDescending:
                    NSLog(@"%@ is larger than %@", str1, str2);
                default:
                    break;
            }
            ```
            - compare方法的options：
                - 忽略大小写的比较：NSCaseInsensitiveSearch方法
                    ```
                    NSString *str1 = @"Lexi";
                    NSString *str2 = @"Jack";
                    int res = [str1 compare: str2 options:NSCaseInsensitiveSearch];
                    ```
                - 完全匹配：NSLiteralSearch
                - 只比较字符串里的数字的大小：NSNumericSearch
            - 判断字符串是否以指定的字符串开头/结尾
                - 开头：(BOOL)hasPrefix:(NSString *)str;
                - 结尾：(BOOL)hasSuffix:(NSString *)str;
                    ```
                    NSString *path = @"/Users/Apple/Music/xxx.mp3";
                    BOOL res = [path hasSuffix:@".mp3"];
                    ```
            - 在主串中搜索子串: - (NSRange)rangeOfString:(NSString *)searchString;
                -  ```
                    typedef struct _NSRange {
                        NSUInteger: location;
                        NSUInteger: length;
                    } NSRange
                    ```
                - ```
                    NSString *str3 = @"I love you.";
                    NSRange range = [str3 rangeOfString:@"love"];
                    NSLog(@"Length: %lu", range.length); //4
                    NSLog(@"Location: %lu", range.location); //2
                    ```
                - 如果没有匹配到，length = 0，location = 0.
                - NSRange是foundation框架里的一个结构体变量，用来表示一段范围。特别用在子串在主串中的范围表示。
                - 声明并初始化结构体变量的方式：
                    - 最原始的方式：
                        ```
                        NSRange range;
                        range.location = 3;
                        range.length = 4;
                        ```
                    - 第二种方式：NSRange range = {3, 7};
                    - 第三种方式：NSRange range = {.location = 3, .length = 7};
                    - 第四种方式：Foundation框架的函数:
                        ```
                        NSRange range = NSMakeRange(loc, len);
                        ```
                - 直接打印NSRnage:
                    ```
                    NSLog(@"%@", NSStringFromRange(ran));
                    ```
        - 字符串的截取：
            - 从指定的下标一直截取到最后 （包括下标）
                ```
                NSString *str = @"I love you.";
                NSString *newStr = [str substringFromIndex:2]; //love you.
                ```
            - 从头一直截取到指定下标（不包括下标）
                ```
                NSString *str = @"I love you.";
                NSString *newStr = [str substringToIndex:6]; //I love
                ```
            - 指定range截取 （包头包尾）
                ```
                NSString *str = @"I love you.";
                NSString *newStr = [str ssubstringWithRange:NSMakeRange(2,5)]; //love
                ```
        - 字符串的替换：(occurance全部替换)
            ```
            NSString *str = @"I love you.";
            NString *newStr = [str stringByReplacingOccurencesOfString: @"love" withString: @"hate"];//I hate you.
            ```
        - 字符串数据类型转换（string to int）
            ```
            NSString *str = @"1";
            int num = str.intValue;
            double num2 = str.doubleValue;
            float num3 = str.floatValue;
            NSInteger num4 = str.integerValue;
            long long num5 = str.LonglongValue;
            BOOL flag = str. boolValue;
            ```
            - 注意，如果字符串并不是严格意义的int或者double之类的（比如"110a110aaa"), 会从头开始转换，能转换多少就转换多少，遇到不能转换的就停止。
        - 去掉字符串的前后空格 (中间的空格去不掉的)
            ```
            NSString *str = @"  xxx   ";
            str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];//xxx
            ```
        - 把小写转换成大写
            ```
            str = [str lowercaseString];
            str = [str uppercaseString];
            ```
        - 去掉指定的子串
            ```
            str = [str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"xxx"]];
            ```
    - NSMutableString （类似StringBuilder）
        - 字符串有恒定性，一旦生成，字符串内容是无法被更改的，修改字符串只能通过重新创建新的字符串对象。如果要多次改变一个字符串的值，会耗费很长的时间，浪费很多空间。
        - 希望：一个对象是用来存储字符串的，且存储的对象的字符串数据是可以更改（经常更改的）- NSMutableString
        - 是Foundation框架中的一个类，从NSString中继承。所以NSMutableString是用来存储字符串数据的，拥有NSString所有的功能，相当于是NSString的扩展，使得存在对象里的字符串数据可以更改，具有可变性，不会新创建对象。
        - 使用方法：
            -  ```
                //以拼接的方法在可变字符串中追加内容
                NSMutableString *str = [NSMutableString string];
                [str appendString:@"jack"];
                [str appendString:@"rose"];//@"jackrose"

                int age = 10;
                [str appendFormat:@"I am %d years old.", age];
                ```
            - ⚠️注意：这种初始化NSMuteableString的方法是不可以的：NSMuteableString *str = @"jack";
                - 因为@"jack"是一个NSString对象，是一个父类对象，父类对象不一定拥有子类的方法（子类一定有父类的方法）。
    
    - NSArray
        - 回忆C语言中的数组
            - 存储多个数据
            - 类型相同
            - 长度固定
            - 每个元素紧密相连
        - 是foundation中的一个类，类的对象是用来存储多个数据的，具备数组的功能，NSArray是OC中的数组。
        - 特点：
            - 只能存储OC对象，任意OC对象
            - 长度固定，一旦NSArray数组创建完毕后，元素长度固定，无法新增，无法删除元素
            - 每个元素都是紧密相连的，每个元素有自己的下标。
            - 元素的类型是id类型。不能存储非oc对象。
        - NSArray创建
            ```
            NSArray *arr = [NSArray arrayWithObjects:@"jack", @"rose", @"lexi", nil]; //在元素写完后要加一个nil，表示这个数组在这里结束了。（如果nil出现在中间，数组也会在中间结束）

            NSArray *arr = @[@"jack", @"rose", @"lexi"]; //简要生成方式，不需要在最后加nil。
            ```
        - NSArray的使用：
            - 打印数组：NSLog(@"%@", arr);
            - 取出数组中的值：
                - 下标：arr[1]，如果下标越界，就直接报错
                - 调用对象方法：[arr objectAtIndex: 1]。
                - 取第一个元素: [arr firstObject]; 与arr[0]的区别是，如果数组为空,arr[0]直接报错，firstObject不会。
                - 取最后一个元素：[arr lastObject];
            - 取NSArray里数组元素的个数：arr.count;
            - 查找指定的元素在数组中第一次出现的下标：[arr indexOfObject:@"lexi"];
            - 判断数组中是否存在某元素：BOOL res = [arr containsObject:@"lexi"]; (如果没有找到返回的事NSUInteger的最大值)
            - nil不可以存入NSArray里，因为nil就是0
        - NSArray的数组遍历：
            - 使用for循环来遍历数组的每一个元素
            - 使用增强for循环来遍历数组中的元素 (和java里是一样的。。。) 声明在for()中的遍历叫做迭代变量，当数组中的对象不一致时，建议使用id类型来遍历
                ```
                for (NSString *str in arr) 
                {
                    NSLog(@"%@", str);
                }
                ```
            - 使用block进行遍历
                ```
                // 这个方法做的事情：将arr数组中的每个元素遍历出来， 如何处理遍历出来的元素需要我们自己定义，要求我们传递一段处理元素的代码过去（这里是把元素打印出来）。
                //如果想停止遍历，就把stop设置为YES
                [arr enumerateObjectsUsingBlock:^(id _Nonull obj, NSUInteger idx, BOOL * _Nonull stop) {
                    NSLog(@"%@", obj);
                }]
                ```
        - NSArray和NSString的两个方法
            - 将数组中的元素连接起来，组成一个新的字符串：
                ```
                NSString *str = [arr componentsJoinedByString:@"#"]; //链接符
                ```
            - 将字符串以指定分隔符分隔
                ```
                NSArray *arr = [str componentsSeparatedByString:@","];
                ```
    - NSMutableArray是NSArray的子类
        - 拥有NSArray的一切属性，相对于父类做了扩展：数组的元素可以动态的新增和删除。其他用法均于NSArray一致。
        - 数组的创建：
            ```
            // 新建一个空的array
            NSMutableArray *arr1 = [NSMUtableArray new];
            NSMutableArray *arr2 = [[NSMutableArray alloc] init];
            NSMutableArray *arr3 = [NSMutableArray array];

            // 新建一个已经有元素的array
            NSMutableArray *arr4 = [NSMutableArray arrayWithObjects:@"jack", @"rose", @"lili", nil];
            ``` 
            - ⚠️最容易犯的错：不可以用 NSMuteableArray *arr5 = @[@"jack", @"rose", @"lili"];来创建，因为这是一个NSArray对象，不是NSMutableArray对象
        - 新增和删除元素
            ```
            [arr1 addObject:@"adam"];

            [arr1 addObject:@[@"jack", @"lucy", @"lili"]]; //此时arr1中有两个元素，第一个是jack，第二个是NSArray，里面有另外三个string。

            [arr1 addObjectsFromArray:@[@"jack", @"lucy", @"lili"]];//此时arr1有4个元素，会把数组中的每个元素拿出来，再把它加入到可变数组arr1中去。

            [arr1 insertObject:@"lexi", atIndex:1]; //adam, lexi, jack, lucy, lili

            [arr removeObjectAtIndex:1]; //adam, jack, lucy, lili

            [arr removeObject:@"lili"]; //adam, jack, lucy删除指定元素（如果有duplicate就全部删除）

            [arr removeObject:@"lili" inRnage:NSMakeRange(0, 3)]; //(删除指定范围中指定元素)

            [arr removeLastObject]; //删除最后一个

            [arr removeAll]; //删除所有元素
            ```
    - NSNumber:
        - 因为NSArray中只能存NSObject，基本数据没法存，如果要存数字，就要把数字包装在NSNumber内，再把NSNumber存储在NSArray中。
        - NSNumber是foundation框架中定义好的类，作用是用来包装基本数据类型的：
            - 先将基本数据类型包装在NSNumber对象中
            - 再将NSNumber对象存入NSArray中
            ```
            NSNumber *num1 = [NSNumber numberWithInt:10];
            //也可以写成（简写方式）
            *num1 = @10;
            //也可写成：
            int num = 10;
            NSNumber *n = @(num);
            
            int realNum1 = num1.intValue;
            NSNumber *num2 = [NSNumber numberWithFloat:10.2f];
            //简写方式
             *num2 = @10.2f;
            float realNum2 = num2.floatValue;




            ```

    
                


            
            


