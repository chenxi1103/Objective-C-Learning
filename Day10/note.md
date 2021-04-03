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
    - 定义一个变量来保存按钮在ios界面上的位置
        