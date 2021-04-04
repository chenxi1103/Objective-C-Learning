## DAY 10
### NSDictionary & NSMutableDictionary
- 一个数据结构可以，存储在数组中，又可以快速唯一的确定数组的元素 => 键值对（key-value pair）存储方式
- NSDictionary & NSMutableDictionary
    - 他们是数组，他们是以键值对的行驶存储数据的。往数组中存储数据的同时，必须制定数据的key。
    - 存储数据原理：
        a. 以键值对的形式存储数据
        b. 字典数组一旦创建，其中的元素无法动态新增删除（NSMutableDictionary可以）
        c. key：只能是遵守了NSCoping协议的对象（比如NSString)
            value：只能是oc对象
    - 创建方式：
        ```
        NSDcitionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"jack", @"name", @"1111 main street", @"address", nil]; //value key value key

        NSDictionary *dict2 = @{@"name":@"rose", @"age":@"18"}; //简要创建方式
        ```
    - 遍历字典：
        - 字典数组中的数据无法通过坐标去取, 可以通过取key来拿value的方式遍历
        ```
        for (id key in dict)
        {
            NSLog(%@, dict[key]);
        }
        ```
        -  打印的顺序，按照键的ascii
    - 字典的存储原理：（和其他语言的dict实现原理都是一样的）
        - 不是按照顺序挨个存储的。
        - 存储键值对的时候，会根据键和数组的长度做哈希算法。算出一个下标，将键值对存在下标处。
        - 取值的时候也是对键做哈希算法，得到下标后直接取值。
        - 和NSArray对比，存的速率肯定是NSArray快一点
    - NSMuteableDictionary:
        ```
        NSMuteableDictionary *dict = [NSMuteableDictionary new];
        NSMuteableDictionary *dict = [NSMuteableDictionary dictionaryWithObjectsAndKeys:@"jack", @"name", @"1111 main street", @"address", nil];

        [dict setObject:@"Lexi", forKey:@"Name"]; //新增键值对
        [dict removeAllObjects]; //删除所有的键值对
        [dict removeObjectForKey:@"Name"]; //删除指定键值对
        [dict writeToFile:@"/Users/Apple/Desktop/dict.plist" atomically:NO]; //把dict写出到文件
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/User/Apple/Desktop/dict.plist"]; //从文件读取dict
        ```
- 集合
    - NSArray, NSDictionary都叫做集合
    - 将对象存储在集合之中，会对对象的引用计数器+1
    - 当集合销毁的时候，就会像存储在集合中的所有对象发送一条release消息
    - 使用@[]或者@{}创建的集合也是被autorelease过的
    - 在ARC模式下，集合的元素都是强类型指针。
- NSFileManager
    - 用来操作磁盘上的文件，文件夹，创建，删除，复制，拷贝，移动
    - 方法：(单例模式)
        ```
        NSFileManager *manager = [NSFileManager defaultManager];

        BOOL res = [manager fileExistsAtPath:@"..."]//文件是否存在于指定path
        BOOL flag = NO;
        BOOL res = [manager fileExistsAtPath:@"..." isDirectory:&flag];//文件是否存在于指定path,且判断是不是directory

        BOOL res = [manager isReadableFilePath:@"////"];//判断文件是否可读
        BOOL res = [manager isWritableFilePath:@"////"];//判断文件是否可写
        BOOL res = [manager isDeletableFileAtPath:@"..."];//判断文件是否可以删除

        NSDictionary *dict = [manager attributesOfItemAtPath:@"..." error:nil];//拿到文件的属性信息：类似于size，lastaccess，filetype, creationtime
        NSArray *arr = [manager subpathsAtPath:@"/Users/Apple/Desktop/"]//拿到当前目录下所有的子目录和子文件

        NSArray *arr = [manager contentsOfDirectoryAtPath:@"..."]//只拿到子目录和子文件，不会拿到子目录下的子目录和子文件（只包括当前path下的）

        [manager createFileAtPath:@"/..." contents:（文件的内容，要求是二进制内容）NSData对象就是专门保存二进制数据的 attributes:nil(默认值)]//创建文件

        NSString *str = @"test";
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];//把数据转化为二进制，准备存入file
        [manager createFileAtPath:@"/..." contents: data attributes:nil]//创建文件

        BOOL res = [manager createDirectoryAtPath:@"///" withIntermediatedirectories:NO attributes nil error:nil];//创建文件夹。

        [manager moveItemAtPath:@"sddfs" toPath:@"xdsfs" error:nil];//移动file

        [manager copyItemAtPath:@"xdfds toPath:@"sdfds" error:nil];//copy文件

        [manager removeItemAtPath:@"sfdfds" error:nil];//删除文件。
        ```
    - 文件终结者
        ```
        int main (int argc, const char * argv[]) 
        {
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSArray *arr = [fileManager constentsOfDirectoryAtPath:path error:nil];
            if (arr.count > 0)
            {
                for (NSString *p in arr)
                {
                    NSString *newP = [NSString stringWithFormat:@"%@%@",path, p];
                    if ([fileManager isDeletableFileAtPath:p])
                    {
                        [fileManager removeItemAtPath:p error:nil];
                    }
                }
            }
        }
        ```

- IOS 界面
    - CGPoint: 定义一个结构体来保存按钮在ios界面上的位置，foundation框架中已经定义了这个结构体CGPoint：
        ```
        struct CGPoint {
            CGFloat x;
            CGFloat y;
        }
        ```
        这个结构体一般情况下是用来表示做表的，用来表示控件在界面上的位置。CGPoint和NSPoint是一样的。
        - 声明CGPoint的方式：
            ```
            CGPoint p1;
            p1.x = 20;
            p1.y = 30;

            CGPoint p1 = {20, 30};

            CGPoint p1 = CGPointMake(20, 30);
            NSPoint p2 = NSMakePoint20, 30);
            ```
    - CGSize: 声明一个变量来保存某个控件的大小（两个数据：宽度，高度）和NSSize是一样的，是同一个结构体，只是定义了两个名称。一般情况用来表示控件的大小。
        ```
        typedef struct
        {
            CGFloat width;
            CGFloat height;
        }CZSize;

        CZSize size = {50, 20};

        CGSize size = CGSizeMake(20, 30);
        NSSize size = NSMakeSize(20, 30);
        ```
    - CGRect和NSRect：这是定义在foundation框架中的结构体，这个结构题用来存空间的位置和大小。
        ```
        struct CGRect {
            CGPoint origin;
            CGSize size;
        }typedef struct CGRect;

        CGRect rect;
        rect.origin = (CGPoint){10, 20};
        rect.size = (CGSize){100, 30};

        CGRect rect = GCRectMake(10, 20, 100, 30);
        NSRect rect = NSMakeRect(10, 20, 100, 30);
        ```
    - NSValue：之前学习的结构体：NSRange/CGPoint/CGSize/CGRect等都是结构体，是无法存储在NSArray上的->解决方案：NSValue类
        ```
        CGPoint p1 = CGPointMake(10, 20);
        CGPoint p2 = CGPointMak(110,120);

        NSValue *v1 = [NSValue valueWithPoint:p1];
        NSValue *v2 = [NSValue valueWithPoint:p2];

        NSArray *arr = @[v1, v2];
        ```

- 获取时间：NSDate
    - 得到时间的各部分可以使用时间格式化器来得到。但比较复杂
    - NSDate的时间处理
        - 可以得到当前时间，创建一个NSDate对象即可，将这个对象输出，就是当前时间（当前系统的格林威治时间，0时区，东八区）
            ```
            NSDate *date = [NSdate date];
            NSLog(@"%@", date);
            ```
        - 格式化输出日期？制定日期输出的格式。
            - 默认格式：年-月-日 时：分：秒 +时区
                ```
                NSDate *date = [NSdate date];
                NSLog(@"%@", date);
                //先创建一个NSDateFormatter对象，这个对象将1个日期转换成制定的格式
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                //再告诉这个日期格式器对象要把日期转换成什么格式
                // yyyy - year
                // MM - month
                // dd - day
                // HH 24-hour
                // hh 12-hour
                // mm minute
                // ss second
                formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
                //使用日期格式器将制定的日期转换成格式的字符串 (转换的时候会自动转换为当前系统的时区)
                NSString *str = [formatter stringFromDate:date];
                NSLog(@"str = %@", str);

                //string 转换为 NSDate
                NSString *strDate = @"2011-12-12 12:12:12";
                NSDateFormatter *formatter = [NSDateFormatter new];
                formatter.dateFormat = @"yyyy-mm-dd hh:mm:ss";
                NSDate *date = [formatter dateFromString:strDate];
                ```
            - 计算时间
                ```
                [NSDate dateWithTimeIntervalSinceNow:5000];//5000s后的时间

                double sj = [endDate timeIntervalSinceDate:startDate];//两个时间的时间差
                ```
            - 得到日期中的各个部分
                - ```
                    NSDate *date = [NSDate date];
                    //1. 创建一个日历对象，日历对象可以从日期对象中取得日期的各个部分
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    //2. 让日历对象从日期对象中取日期的各个部分
                    NSDateComponents *com = [calendar components:NSCalendarUnitYear fromDate:date];
                    NSLog(@"%ld-%ld-%ld", com.year, com.month, com.day);
                    ```
        ```

- 不论MRC还是ARC下，NSString类型的属性都不可以用assign，而要用copy
- copy：
    - 是一个方法，定义在NSObject之中，作用：拷贝对象
    ```
    NSString *str = @"lexi";
    NSString *str2 = [str copy]; //copy没有产生新对象，而是直接将对象的地址返回，这种拷贝叫做浅拷贝shallow copy

    NSMutableString *str3 = [NSMutableString stringWithFormat:@"lexi"];
    NSString *str4 = [str3 copy];//NSMutableString调用copy对象时会产生新对象，这样的拷贝叫深拷贝deep copy，但注意copy出来的是NSString，不是NSMuteableString

    NSString *str = @"lexi";
    NSMuteableString *str2 = [str muteableCopy]//NSString调用muteableCopy方法是深拷贝，生成的是NSMuteableString对象

    NSMutableString *str3 = [NSMutableString stringWithFormat:@"lexi"];
    NSMuteableString *str4 = [str3 muteableCopy];//NSMutableString调用muteableCopy对象时会产生新对象，这样的拷贝叫深拷贝deep copy，copy出来的是NSMuteableString
    ```
    - 字符串对象拷贝的引用计数器问题：
        - 若字符串对象存在常量区中，常量区的数据是不允许被回收的，所以存储在常量区的字符串对象引用计数器是一个超大的数字，且retain和release无效
        - 若字符串对象存储在堆区，这个字符串对象和普通的对象是一样的，引用计数器默认是1.
        - 如果是浅拷贝，会对对象的引用计数器+1，因为又有一个指针指向这个对象了。
        - 如果是深拷贝，不会对对象没有任何影响，因为我们创建了一个全新的对象。

- @property里的copy：可以在赋值的时候自动做copy，如果一个属性是NSString类型，一定要写copy
    - copy方法的确是定义在NSObject中的方法，但copy方法内部还调用了另外一个方法叫copyWithZone。这个方法是定义在NSCoping协议，如果我们自定义的类没有遵守NSCoping协议，如果需要让我们的类具有自我copy的能力，就必须要遵守NSCoping协议且实现conpyWithZone方法，并且要自己决定要做深拷贝还是浅拷贝
    - 实现copyWithZone
        ```
        //如果要做深拷贝，就要重新创建新的对象，并把对象属性的值一一复制，再将新对象返回
        Person *p1 = [Person new];
        p1.name = _name;
        p1.age = _age;
        return p1;

        //如果要做浅拷贝，非常简单，直接return self
        return self;
        ```
- 单例模式
    - 定义：一个类的对象，无论在何时何地创建，无论创建多少次，创建出来的都是同一个对象。
    - 原理：
        - 无论如何创建对象，最后都要调用alloc方法
        - 然而alloc中又实际上调用了allocWithZone方法，所以创建对象的本质是allocWithZone方法，于是我们要自己定义allocWithZone方法
        - 我们想要创建出来的是同一个对象，而不是新的对象，我们就有用到static这个变量，判断对象有没有被创建过，如果没有就创建，如果已经被创建过了就返回那个已经被创建的对象，这样我们在整个程序运行过程中就只创建了一个对象。
    - 如何实现：
        ```
        + (instancetype)allocWithZone:(struct _NSZone *)zone
        {
            static id instance = nil;
            if (instance == nil)
            {
                instance = [super allocWithZone:zone];
            }
            return instance;
        }
        //规范，要为外界提供一个方法叫sharedXXX
        + (instancetype) sharedPerson
        {
            return [self new];
        }
        //规范，要为外界提供一个方法叫defaultXXX
        + (instancetype) defaultPerson
        {
            return [self new];
        }
        ```
    - 什么时候要把类设计成单例模式？
        - 特点：不论创建多少次对象，得到的都是同一个对象，存储在单例对象可以被共享。
        - 如果数据需要被整个程序所共享，就可以将数据以属性的方式存储在对象中。