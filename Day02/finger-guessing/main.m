//
//  main.m
//  finger-guessing
//
//  Created by Li, Chenxi on 3/18/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

/*
 1. 猜拳游戏的流程
    1）玩家出拳
    2）机器人出拳
    3）裁判宣布比赛结果
 2. 面向对象的重点在于找类
    1）玩家类
        属性：姓名、选择的拳头、得分
        方法：出拳 -> 自行选择
    2）机器人类
        属性：姓名、选择的拳头、得分
        方法：出拳 -> 随机
    3）裁判类
        属性：姓名
        方法：判断输赢并显示分数
 
 3.  枚举或者结构体定义在什么地方
     如果只是一个类要用，那么定义在类的头文件中。
     如果多个类要用，那么就定义在一个单独的头文件中，谁要用，谁就去引用就可以
 
 
 
 */
#import <Foundation/Foundation.h>
#import "Player.h"
#import "Robot.h"
#import "Judge.h"

int main(int argc, const char * argv[])
{
    Player *p = [Player new];
    p->_name = @"Lexi";
    
    Robot *r = [Robot new];
    r->_name = @"AlphaGo";
    
    Judge *j = [Judge new];
    j->_name = @"Judge";
    
    while(1) {
        [p showFist];
        [r showFist];
        [j judgeResultWithPlayer:p andRobot:r];
        NSLog(@"Continue??? [y/n]");
        char ans = 'n';
        rewind(stdin);
        scanf("%c", &ans);
        if (ans != 'y')
        {
            NSLog(@"Bye~");
            break;
        }
    }
    return 0;
}
