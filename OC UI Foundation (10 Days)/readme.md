## Day01
- ios开发学习内容
    - 搭建软件界面（ui）-> 发送网络请求（多线程/网络） -> 网络数据解析（json/xml）-> 在界面上显示数据
- UI框架：
    - UIKit: 创建和管理应用程序的用户界面
    - QuarzCore: 提供动画特效以及通过硬件进行渲染的能力
    - CoreGraphics: 提供2d绘制的基于c的api
    - CoreLocation: 使用gps和wiki获取位置信息
    - MapKit: 为应用程序提供内嵌地图借口
    - AVFoundation: 音频视频处理

- 第一个程序：加法计算器
    - new project: select iOS -> select "Single View Application"
    - UIView是一个容器，容器意味着可以装其他的子控件。
        - UILable - 文本标签
        - UIButton - 按钮：监听用户点击事件，在用户点击后做出响应。
        - ....任何一个控件都继承于UIView
        - 只负责收集数据，展示数据
    - UIViewController：管理UIView
        - UIView什么时候创建，什么时候销毁
    - 第一响应者（first responder）
    - IBAction: 表示方法（void方法）
    - IBOutlet: 表示属性
    - 常见的拖线问题：
        - this class is not key value coding-compliant (之前拖线的方法被删了)
- 第二个程序：按钮的基本使用
    - 按钮功能较多，既能显示文字，又能显示图片，还能随时调整内部图片和文字的大小位置。
    - frame：位置 + 大小
    - center：位置
    - bounds：大小(中心点不变)
    - transform：什么都能改。
    - animation:
        ```
        [UIView animateWithDuration:1 animations:^{
            self.photo.bounds = originBound;
        }];
        ```
- 动态创建控件
    - 只要viewDidLoad方法被执行了，表示控制器所管理的view创建好了。
    - 动态创建控件可以在viewDidLoad里实现。
        ```
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"press me" forState:UIControlStateNormal];
        [button setTitle:@"xxxx" forState:UIControlStateHighlighted];

        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];

        UIImage *imgNormal = [UIImage imageNamed:@"btn_01"];
        UIImage *imgHighlighted = [UIImage imageNamed:@"btn_02"];

        [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
        [button setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];

        button.frame = CGRectMake(50, 100, 100, 100);

        // 通过代码为按钮注册一个单击事件
        [button addTarget:self action:@selector(buttonClick) forControlEvents: UIControlEventTouchUpInside]; 

        [self.view addSubview:button];
        ```

## Day 02 控件的属性
- Transform属性: 修改控件的位移，缩放，旋转
    - CGAffineTransform CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty); (基于当前值进行修改)
    - CGAffineTransform CGAffineTransformMakeScale(CGFloat sx, CGFloat sy);
    - CGAffineTransform CGAffineTransformMakeRotation(CGFloat angle);
- superview
    - 拿到所有子控件：self.view.subviews
    - 拿到这个空间属于的大view(父控件）：self.txt.superview
    - 添加一个子控件：- (void) addSubview: (UIView *)view;
    - 从父控件中移除： - (void) removeFromSuperview;
- 根据tag拿到某个控件
    - [self.view viewWithTag:1000]
- 图片浏览器
    - plist: property list -> 本质是一个xml文件（extensible mark language）
    - 标记语言
- UIImageView帧动画相关属性和方法
    - @property(nonatomic, copy) NSArray *animationImages;
        - 需要播放的序列帧图片数组（里面都是UIImage对象，会按顺序显示里面的图片）
    - @property(nonatomic) NSTimeInterval animationDuration;
        - 帧动画的持续时间
    - @property (nonatomic) NSInteger animationRepeatCount;
        - 帧动画执行次数（默认无限循环）
    - (void) startAnimating;
        - 开始执行帧动画
    - (void) stopAnimating;
        - 停止执行帧动画
    - (BOOL) isAnimating;
        - 是否正在执行帧动画    

    - 两种加载图片的方式
        - 通过imageNamed,这种方式是利用缓存的方式加载图片。图片会一直保存在内存中不会释放，下次再使用同样的图片不需要重新加载，加载起来的图片即使没有强类型指针引用了也不会被销毁。所以应用程序占用内存会过大。
        - 通过imageWithContentsOfFile（不可以直接写图片名称了，而要写清楚文件的路径），只要没有强类型指针引用就会被销毁。（// 等动画执行完毕后要清空内存，延迟执行setAnimationImage = nil,要用performSelector来延迟执行 [self.pic performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.pic.animationImages.count * 0.04];）
