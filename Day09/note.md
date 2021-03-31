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
                
    - 
                


            
            