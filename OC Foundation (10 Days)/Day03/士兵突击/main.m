//
//  main.m
//  士兵突击
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//

/**
 利用面向对象，模拟如下流程：
    士兵 开枪 射出子弹
    士兵类：
        属性：姓名 兵种
        行为：开火的方法
    枪类：
        属性：型号，射程
        行为：射击
    子弹类 (option)
 */

#import <Foundation/Foundation.h>
#import "Soldier.h"
int main(int argc, const char * argv[]) {
    BulletClip *b = [BulletClip new];
    [b setMaxCapacity:100];
    [b setBulletCount:100];
    Gun *ak47 = [Gun new];
    [ak47 setModel:@"AK47"];
    [ak47 setBulletClip:b];
    
    Soldier *s = [Soldier new];
    [s setName:@"Lexi"];
    [s setType:@"Artillery"];
    [s setGun:ak47];
    
    for (int i = 0; i < 101; i++)
    {
        [s fire];
    }
    return 0;
}
