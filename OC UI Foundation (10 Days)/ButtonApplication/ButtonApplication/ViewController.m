//
//  ViewController.m
//  ButtonApplication
//
//  Created by Li, Chenxi on 4/5/21.
//

#import "ViewController.h"

@interface ViewController ()
//- (IBAction)upMove;
//- (IBAction)rightMove;
//- (IBAction)downMove;
//- (IBAction)leftMove;
- (IBAction)move:(UIButton *)sender;
- (IBAction)sliderChange:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UIButton *photo;


@end

@implementation ViewController

static float ORIGINAL_SIZE = 250;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sliderChange:(UISlider *)sender {
    float curValue = [sender value] * 2;
    CGRect originBound = self.photo.bounds;
    originBound.size.height = ORIGINAL_SIZE * curValue;
    originBound.size.width = ORIGINAL_SIZE * curValue;
    [UIView animateWithDuration:1 animations:^{
        self.photo.bounds = originBound;
    }];
}

- (IBAction)move:(UIButton *)sender {
    CGRect originFrame = self.photo.frame;
    switch(sender.tag)
    {
        //up
        case 1:
            originFrame.origin.y -= 100;
            break;
        //right
        case 2:
            originFrame.origin.x += 100;
            break;
        //down
        case 3:
            originFrame.origin.y += 100;
            break;
        //left
        case 4:
            originFrame.origin.x -= 100;
            break;
        default:
            break;
    }
    [UIView animateWithDuration:1 animations:^{
        self.photo.frame = originFrame;
    }];
}

//- (IBAction)upMove {
//    //获取photo的y坐标，让y坐标递减
//    //ps：修改结构体变量不可以直接修改，要先取出来，修改后再赋回去。
//    CGRect originFrame = self.photo.frame;
//    originFrame.origin.y -= 10;
//    self.photo.frame = originFrame;
//}
//
//- (IBAction)leftMove {
//    CGRect originFrame = self.photo.frame;
//    originFrame.origin.x -= 10;
//    self.photo.frame = originFrame;
//}
//
//
//- (IBAction)downMove {
//    CGRect originFrame = self.photo.frame;
//    originFrame.origin.y += 10;
//    self.photo.frame = originFrame;
//}
//
//- (IBAction)rightMove {
//    CGRect originFrame = self.photo.frame;
//    originFrame.origin.x += 10;
//    self.photo.frame = originFrame;
//}


@end
