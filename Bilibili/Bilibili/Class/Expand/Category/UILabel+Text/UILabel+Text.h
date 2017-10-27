//
//  UILabel+Text.h
//  Nav_BackGroundColor
//
//  Created by Apple-T on 16/9/14.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Text)

@property (nonatomic, strong) NSString *distributeString;
//  最小行高
@property (nonatomic, assign) CGFloat minimumLineHeight;
//  最大行高
@property (nonatomic, assign) CGFloat maximumLineHeight;
//  行间距
@property (nonatomic, assign, getter=jf_lineSpacing) CGFloat lineSpacing;

//@property (nonatomic, assign) CGFloat

@end
