//
//  ViewController.m
//  Day01-Add-Calculator
//
//  Created by Li, Chenxi on 4/4/21.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *number1;
@property (weak, nonatomic) IBOutlet UITextField *number2;
@property (weak, nonatomic) IBOutlet UILabel *result;
- (IBAction)calculateButton;
@end

@implementation ViewController

- (IBAction)calculateButton {
    //1. get user input
    NSString *num1 = self.number1.text;
    NSString *num2 = self.number2.text;
    //2. compute
    int res = [num1 intValue] + [num2 intValue];
    
    //3. show result
    self.result.text = [NSString stringWithFormat:@"%d", res];
    
    //4. 叫回键盘
    // self.view表示当前控制器所管理的那个view，
    /**
     4. 叫回键盘：self.view表示当前控制器所管理的那个view，让控制器所管理的view停止编辑，这样凡是这个view中的子控件叫出的键盘就回去了。
     */
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
