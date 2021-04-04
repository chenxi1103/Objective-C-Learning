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