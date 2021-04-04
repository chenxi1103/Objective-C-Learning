//
//  main.m
//  Day05
//
//  Created by Li, Chenxi on 3/22/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

/**
 1. 创建一个对象，对象的内存如何分配
    a 子类对象又自己的属性和父类的属性
    b 代码段中的每一个类都有一个isa指针，这个指针指向它的父类，一直指到NSObject. 如果调用父类的对象/方法，回根据isa指针找父类，如果有就执行，没有就接着根据isa找父类，一直找到这个方法为止。
 
 2. 结构体和类的区别，如何选择？
    a 相同点：都可以将多个数据封装为一个整体。
    b 不同点：结构体只能封装数据，类还可以封装行为（方法）| 结构体在栈空间，类在堆空间
    c 应用场景：
        1 如果表示的实体，不仅由多个数据组成，这个是实体还有行为，用类
        2 栈的特点：空间相对较小，但是存储在栈中的数据访问效率更高
         堆的提点：空间相对较大，但是存储在堆中的数据访问效率较低
        3 如果表示的实体没有行为，光有属性，如果属性不多（2-5），可以用结构体来提高效率，如果属性太多，用类
    d 赋值
        结构体：Student
        类：Person
        Student s1 = {"jack", 19, GenderMale};
        Student s2 = s1; //值赋值
 
        Person *p1 = [Person new];
        Person *p2 = p1; //指针赋值
 
 3. 类的本质
    a 内存中的五大区域：
        栈：局部变量
        堆：oc对象，和用realoc，caloc，maloc自己申请的空间的
        bss段：存储未初始化的全局变量和静态变量。
        数据段：常量
        代码段：用来存储代码的
 
        类加载：当类第一次被访问的时候，这个类就会被加载到代码段存储起来。
    b 讨论三个问题
        1 类什么时候加载到代码段？
            类第一次被访问的时候。
        2 类以什么样的形式存储在代码段
            任何存储在内存中的数据都有一个数据类型。（int/float/char）
            任何在内存中申请的空间也有自己的类型。
            在代码段存储类的那块空间是什么类型的：
                a 先在代码段中创造一个class对象，class是foundation框架中的一个类cls-，这个class对象就是用来存储类信息的。（至少有3个属性；类名/类的属性们/类的方法们）
                b 将类的信息存储在一个class对象之中
                c 所以类是以class对象的形式存储在代码段的，存储类的这个class 对象，我们也叫做类对象，用来存储类的一个对象。所以class对象里面会有isa指针，这个指针指向存储父类的类对象。
        3 类一旦被加载到代码段之后，什么时候回收
            类一旦被加载到代码段后是不会被回收的，除非程序退出。
 
 4. 类对象的使用：
    a 如何拿到存储在代码段的类对象：
        1 调用类的方法class （[Person class])，就可以拿到存储person类的类对象。
        2 调用对象方法的class（Person *p = [Person new]; [p class])
        3 对象中的isa指针的值其实就是代码段中存储类的类对象的地址
        ⚠️注意：声明class指针的时候不需要加*，因为在typedef的时候已经加了*了。
    b 拿类对象有什么用：
        1 类对象就等价于类本身。类对象等价于本身，所以可以用类对象来调用类方法，类能做的事类对象也能做。
        2 可以使用类对象，来调用new方法，创建存储在类对象中的类的对象
 
 5. SEL: selector选择器
    它是一个数据类型，所以要在内存中申请空间存储数据
    SEL其实是一个类，SEL对象是用来存储一个方法的。
 
    类是以class对象的形式存储在代码段之中的：
        类名：NSString
        属性：
        方法：方法是以SEL对象存储起来的，每个SEL对象就是一个方法（类似一个数组存储所有方法）
            1 先创建一个SEL对象
            2 将方法的信息存储在SEL对象中
            3 再将SEL对象作为类对象的属性存储起来
    拿到存储方法的SEL对象？
        1 因为SEL是一个typedef类型的，在自定义的时候已经加了*了，所以我们在声明SEL指针的时候，不需要加*。
            SEL s1 = @selector(sayHi);
 
 5. 调用方法的本质（内部原理）
    [p1 sayHi];
    1. 先拿到存储sayHi方法的SEL对象，拿到SEL数据，SEL消息。
    2. 将这个SEL消息发给p1对象。
    3. 这个时候，p1对象接受到消息后，知道要调用方法
    4 根据对象的isa指针找到存储类的类对象
    5 找到这个类对象以后，在这个类对象中去搜寻是否有和传入SEL数据相匹配的，如果有就执行，没有就再找父类，直到找到NSObject.
    OC最重要的机制：消息机制 -> 调用方法的本质其实就是为对象发送SEL消息。
    6. 手动为对象发送sel数据？
        1 先得到方法的sel数据
        2 用performSelector方法手动把sel数据发送给对象：
            SEL s1 = @selector(sayHi);
            [p1 performSelector:s1]; 与[p1 sayHi]是一样的。
    7. 注意事项：如果方法有参数，方法名带有冒号
             如果方法有参数，用performSelector withObject方法来把参数也传进去。
 
6. 点语法：
    java，c#等对象可以使用点语法访问对象的成员
    oc也可以使用点语法来访问对象的属性，但是本质完全不同。
    oc对象如果要为对象赋值取值，要调用对应的getter/setter，使用点语法访问对象属性：
        对象名.去掉下划线的属性名。
        p1.name = @"Lexi";
        NSString *name = p1.name;
    点语法的原理：
        1 p1.age = 19; 这句话的本质并不是把19直接赋给_age属性，点语法回再编译器编译的时候，将点语法转换为调用getter和setter代码。
        2 ⚠️这个原理和java完全不同，因为p1.name == [p1 setName], 所以如果在setter里面这么写: self.name = name, 会产生死循环因为它会转换为[self setName]开始自己调用自己。这和java是完全不同的。
        3. 又因为点语法会转换为getter/setter，所以如果某属性没有实现getter/setter，点语法完全无效。
 7. @property
    写一个类需要先声明属性再声明属性的getter/setter再实现，非常tedious。
    property关键字可以自动的生成getter/setter的声明，然后编译器在编译的时候，会根据@property再生成getter/setter的实现。
    语法：@property 数据类型 数据名称（数据名称去掉下划线！ 写在方法声明中）
          property只能生成声明，实现还得自己来，属性也得自己写。
 
 8 @synthesize
    @property只能生成getter和setter的声明，实现还得自己来
    方法实现的代码也可以自动生成。@synthesize写在implementation中
    写法: @synthesize age；
        @synthesize setAge;
    效果：
        a 生成一个真私有的属性，属性的类型和@synthesize对应的@property类型益智，属性名字和@synthesize对应的@property名字一致。
        b 自动生成setter方法的实现。
    组合：点语法+property+synthesize可以简化属性的声明/getter/setter，组合以后，可以不用在interface声明属性了。
    特殊要求：希望@synthesize不要自动生成私有属性？
            语法：@synthesize age = _age ->不会再去生成私有属性，直接生成getter/setter的实现。
    注意：
        a 如果直接写一个@synthesize，会自动生成私有属性+setter+getter
        b 如果@synthesize age = _age ->不会再去生成私有属性，直接生成getter/setter的实现
        c 生成的setter方法实现中没有任何逻辑验证，直接赋值，如果要做逻辑验证，要自己在类的实现中重写setter。
        d 批量声明？@property float height, weight; (类型一致的可以批量声明）
                 @synthesize height, weight, age, name; (类型不一致也可以放在一起批量声明）
                 @synthesize height=_height, weight=_weight, age=_age, name=_name;
9. @property的增强：
    @synthesize+property是xcode4.4之前的写法， 之后xcode做了一个property增强，只需要写一个property，编译器就会自动的
            1 生成私有属性
            2 生成 getter/setter的声明
            3 生成 getter/setter的实现
    使用注意：
        1 增强后的property也可以批量声明相同类型的property！
        2 但property生成的setter没有做逻辑验证，要做就重写setter方法。
        3 ⚠️如果同时重写getter和setter，就不会自动生成私有属性了！需要自己声明这个属性（做全套）
 
 10 动态类型 / 静态类型
    a oc是一门弱语言。弱语言指的是，编译器在编译的时候，检查没有那么严格。
    b 静态类型：指的是一个指针指向的对象是一个本类对象。
    c 动态类型：指的是一个指针指向的对象不是本类对象。
    d 编译检查：编译器在编译的时候，能不能通过一个指针去调用指针指向的对象的方法。（判断原则：看指针所属的类型之中有没有这个方法，如果有就认为可以调用，编译通过，否则编译报错）在编译的时候，能不能调用对象的方法主要看指针的类型。我们可以将指针的类型进行强转换来达到骗过编译器的效果。（实际上任意指针可以指向任意对象，编译器都不会报错，所有类型的指针都是8个字节）
    e 运行检查：运行时会去检查对象中是否真的有这个方法，如果有则执行否则报错。
 
 11. NSObject：是所有类的基类，NSObject指针可以指向任意的oc对象。所以NSObject指针是一个万能指针，可以指向任意的oc对象。
            但如果要调用指向的子类对象独有的方法，就必须做类型转换。
 12. id指针：也是万能指针，可以指向任意的oc对象。
            a id是一个typedef自定义类型，定义的时候已经加了*，声明时就不用写*了
            b 万能指针，任意对象都能指，和NSObject一样，不同点在于：在编译时，通过NSObject指针调用对象的方法的时候，编译器会做编译检查，用id类型指针调用则不会检查，编译器直接通过。
        注意：id指针不能使用点语法，它只能调用方法不能调用属性。如果我们要声明万能指针，prefer声明id指针rather than nsobject
 
 13 instancetype：代表当前方法返回值是当前类的对象。但注意intancetype只能作为方法的返回值，不能在别的地方使用。instancetype是一个有类型的代表当前类的对象。id是一个无类型的指针，仅仅是一个地址。
 
 14 苹果的编译器叫：LLVM
    编译器很好被骗过因为编译器之判断指针的类型，就算编译通过也不意味可以完美执行。
    怎么保证一个函数一定能被一个类对象执行：
        a repsonseToSelector方法 （最常用）
        b isKindOfClass方法：判断指定对象是否为指定类或其子类对象。
        c isMemberOfClass方法：只判断指定对象是否为指定类的对象（不判断子类对象）。
        d isSubclassOfClass方法：判断是否是子类对象
        e instancesRespondToSelector: 判断类里面有没有类方法（所以参数是类）。
 
 15 构造方法：
    a [类名 new] -> new方法的内部是先调用alloc方法，在调用init方法。alloc方法是一个类方法，作用：哪个类调用这个方法，就创建哪个类的对象，并把对象返回。init方法是一个对象方法，作用：初始化一个对象。创建对象的完整步骤：1. alloc创建对象，2. init初始化对象。虽然没有初始化的对象有的时候也可以使用，但是千万不要这么做，使用未初始化的对象是非常危险的。
    [Person new] == [[Person alloc] init];
    b init方法
        作用：初始化对象，为对象的属性赋初始值，这个init方法叫做构造方法。
            如果属性的类型是基本数据类型，就赋值为0
            如果属性的类型是c指针，就赋值为NULL
            如果属性的类型是oc指针，就赋值为nil
    c 重写init方法
        作用：自定义初始化的方法->按自己的方式给对象属性赋值。
             重写init方法的规范：
                1 必须先调用父类的init方法，再将方法的返回值赋值为self。
                2 调用init方法初始化对象有可能会失败，如果初始化失败，返回的就是nil。
                3 判断父类是否初始化成功 （if self != nil)，如果不为nil，说明初始化成功，再进一步赋值。
                4 返回self
            解惑：
                1 为什么调用父类init方法？因为父类的init方法会初始化父类的属性，必须保证当前对象中的父类属性也被初始化。
            - (instancetype) init {
                self = [super init];
                if (self) {
                    xxxx
                }
                return self;
            }
    d 创建对象的时候的属性值让创建对象的人来制定？自定义构造方法（带参数）
        规范：
            1 自定义构造方法的返回值必须是instancetype
            2 自定义构造方法的名称必须以initWith开头
            3 方法实现和init的要求一样
        实例：详见“构造方法” target
 
 
    
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
