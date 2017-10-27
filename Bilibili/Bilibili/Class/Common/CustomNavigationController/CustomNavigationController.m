//
//  CustomNavigationController.m
//  Bilibili
//
//  Created by Apple-T on 16/9/12.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@property (nonatomic, weak) UIImageView *hairLineImageView;

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hairLineImageView = [self findHairlineImageViewUnder:self.navigationBar];
    _hairLineImageView.hidden = YES;
}

#pragma mark - 

/*!
 *  遍历寻找 bar 底部分割线的 imageView
 *
 *  @param view 被遍历的父视图
 *
 *  @return bar 底部分割线
 */
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
