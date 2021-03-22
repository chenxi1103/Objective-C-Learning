//
//  Computer.h
//  Day03
//
//  Created by Li, Chenxi on 3/21/21.
//  Copyright © 2021 Li, Chenxi. All rights reserved.
//
/*
组合类型例子：
    计算机类的属性：
       cpu 内存 主板 显卡 声卡 网卡
    计算机类的功能：
       开机 关机 播放影片
*/

#import <Foundation/Foundation.h>
#import "CPU.h"

@interface Computer : NSObject
{
    CPU *_cpu;
}
- (void) setCpu: (CPU *)cpu;
- (CPU *) cpu;
@end

