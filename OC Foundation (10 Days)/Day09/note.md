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

    
                


            
            