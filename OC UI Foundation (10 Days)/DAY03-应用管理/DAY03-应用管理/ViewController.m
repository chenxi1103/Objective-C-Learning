//
//  ViewController.m
//  DAY03-应用管理
//
//  Created by Li, Chenxi on 4/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

//充血apps属性的get方法，进行懒加载数据
- (NSArray *)apps
{
    if (_apps == nil) {
        // 1. 获取app.plist文件在手机上的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
        // 2. 根据路径加载数据
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //每行应用的个数
    int columns = 3;
    CGFloat viewWidth = self.view.frame.size.width;
    //每个应用的宽和高
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 80;
    CGFloat marginX = (viewWidth - columns * appW) / (columns + 1);
    CGFloat marginY = marginX;
    
    for (int i = 0; i < self.apps.count; i++) {
        NSDictionary *appDict = self.apps[i];
        int colIndex = i % columns;
        int rowIndex = i / columns;
        CGFloat appX = marginX + colIndex * (appW + marginX);
        CGFloat appY = marginTop + rowIndex * (appH + marginY);
        
        //创建每个UIView
        UIView *appView = [[UIView alloc] init];
        //设置appview的属性
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        //往UIView里加子控件
        UIImageView *img = [[UIImageView alloc] init];
        CGFloat w = 50;
        CGFloat h = 50;
        CGFloat x = (appView.frame.size.width - w) * 0.5;
        CGFloat y = 0;
        img.frame = CGRectMake(x, y, w, h);
        [appView addSubview:img];
        img.image = [UIImage imageNamed:appDict[@"icon"]];
        
        
        UILabel *lbl = [[UILabel alloc] init];
        lbl.frame = CGRectMake(0, h, appView.frame.size.width, 20);
        [appView addSubview:lbl];
        lbl.text = appDict[@"name"];
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentCenter;
        
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(x, h + 20, w, 20);
        [appView addSubview:btn];
        [btn setTitle:@"check" forState:UIControlStateNormal];
        [btn setTitle:@"checked" forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [btn setBackgroundImage: [UIImage imageNamed:@"button1"] forState:UIControlStateNormal];
        [btn setBackgroundImage: [UIImage imageNamed:@"button2"] forState:UIControlStateHighlighted];
        
        //为按钮注册单击事件
        [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        
        //将appView加到self.view里
        [self.view addSubview:appView];
    }
    
}

- (void) btnClicked
{
    
}

@end
