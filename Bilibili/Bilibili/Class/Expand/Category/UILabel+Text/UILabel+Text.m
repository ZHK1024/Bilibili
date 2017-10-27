//
//  UILabel+Text.m
//  Nav_BackGroundColor
//
//  Created by Apple-T on 16/9/14.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "UILabel+Text.h"
#import <CoreText/CoreText.h>
#import <objc/runtime.h>

//  字体属性
static const void *kJFTextArrtibutes = "jf_textAttribute";
//  ParagraphStyle
static const void *kJFParagraphStyle = "jf_paragraphStyle";

@implementation UILabel (Text)

#pragma mark - Swizzing

+ (void)load {
    // textAlignment
    
//    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(setTextAlignment:)), class_getInstanceMethod([self class], @selector(jf_setTextAlignment:)));
}

#pragma mark - Property method

// distribute string
- (void)setDistributeString:(NSString *)distributeString {
    
    CGFloat margin = (self.frame.size.width - [self stringWidthInSingleLine:distributeString]) / (distributeString.length - 1);
    
    NSLog(@"%f", self.frame.size.width);
    NSLog(@"%f", [self stringWidthInSingleLine:distributeString]);
    NSLog(@"%f", margin);
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:distributeString];
    
    [string addAttribute:(id)kCTKernAttributeName value:@(margin) range:NSMakeRange(0, distributeString.length - 1)];
    
    self.attributedText = string;
}

- (NSString *)distributeString {
    return self.attributedText.string;
}

// minimumLineHeight
- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight {
    NSMutableParagraphStyle *style = [self jf_paragraphStyle];
    style.minimumLineHeight = minimumLineHeight;

    [self changeAttributeWithAttributeName:NSParagraphStyleAttributeName attributeValue:style];
    [self refreshTextAttributes];
}

- (CGFloat)minimumLineHeight {
    return [self jf_paragraphStyle].minimumLineHeight;
}

// maximumLineHeight
- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight {
    NSMutableParagraphStyle *style = [self jf_paragraphStyle];
    style.maximumLineHeight = maximumLineHeight;
    
    [self changeAttributeWithAttributeName:NSParagraphStyleAttributeName attributeValue:style];
    [self refreshTextAttributes];
}

- (CGFloat)maximumLineHeight {
    return [self jf_paragraphStyle].maximumLineHeight;
}

// lineSpacing
- (void)setLineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *style = [self jf_paragraphStyle];
    style.lineSpacing = lineSpacing;
    
    [self changeAttributeWithAttributeName:NSParagraphStyleAttributeName attributeValue:style];
    [self refreshTextAttributes];
}

- (CGFloat)jf_lineSpacing {
    return [self jf_paragraphStyle].lineSpacing;
}

// attributes
- (void)changeAttributeWithAttributeName:(NSString *)attributeName attributeValue:(id)attribute {
    [[self jf_textAttributes] setValue:attribute forKey:attributeName];
}

- (NSMutableDictionary *)jf_textAttributes {
    NSMutableDictionary *attributes = objc_getAssociatedObject(self, kJFTextArrtibutes);
    if (!attributes) {
        attributes = [NSMutableDictionary new];
        objc_setAssociatedObject(self, kJFTextArrtibutes, attributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return attributes;
}

// ParagraphStyle
- (NSMutableParagraphStyle *)jf_paragraphStyle {
    NSMutableParagraphStyle *style = objc_getAssociatedObject(self, kJFParagraphStyle);
    if (!style) {
        style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = self.textAlignment;
        objc_setAssociatedObject(self, kJFParagraphStyle, style, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return style;
}

// textAlignment
- (void)jf_setTextAlignment:(NSTextAlignment)textAlignment {
    [self jf_setTextAlignment:textAlignment];
    [self jf_paragraphStyle].alignment = textAlignment;
}

#pragma mark - Private method

- (void)refreshTextAttributes {
    NSString *text = self.text;
    if (text.length == 0) {
        text = self.attributedText.string;
        if (text.length == 0) {
            return;
        }
    }
    self.attributedText = [self makeAttributedStringWithString:text];
}

- (NSAttributedString *)makeAttributedStringWithString:(NSString *)string {
    NSMutableAttributedString *tempString = [[NSMutableAttributedString alloc] initWithString:string attributes:[self jf_textAttributes]];
    return tempString;
}

/*!
 *  单行时候 text 显示完整需要的宽度
 *
 *  @param text  text 内容
 *
 *  @return  text 宽度
 */
- (CGFloat)stringWidthInSingleLine:(NSString *)text {
    CGSize size = [text boundingRectWithSize:self.frame.size
                       options:NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin
                    attributes:@{NSFontAttributeName: self.font} context:nil].size;
    return size.width;
}

@end
