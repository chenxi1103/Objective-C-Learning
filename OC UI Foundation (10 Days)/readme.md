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