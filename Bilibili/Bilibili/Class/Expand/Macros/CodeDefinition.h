//
//  CodeDefinition.h
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

//屏幕的bounds
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
//debug随机颜色
#define DEBUG_COLOR [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1.0]
//frame
#define FRAME(X, Y, W, H) CGRectMake((X), (Y), (W), (H))
//RGB创建颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]
// weak self
#define WS(ws) __weak typeof(self) ws = self
