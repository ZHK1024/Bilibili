//
//  GeneralCollectionCell.m
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "GeneralCollectionCell.h"
#import <Masonry.h>
#import "CodeDefinition.h"
#import "LiveModel.h"
#import <UIImageView+AFNetworking.h>
//#import "UILabel+Text.h"

#define FONT_SIZE 13.0

@interface GeneralCollectionCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation GeneralCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    
    WS(ws);
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView);
        make.top.equalTo(ws.contentView);
        make.right.equalTo(ws.contentView);
        make.bottom.equalTo(ws.contentView).offset(-40.0);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView);
        make.right.equalTo(ws.contentView);
        make.top.mas_equalTo(ws.iconView.mas_bottom);
        make.bottom.equalTo(ws.contentView);
    }];
}

#pragma mark - Setter

- (void)setLive:(LiveModel *)live {
    if (_live != live) {
        _live = live;
        
        if ([self stringWidthInSingleLine:_live.title].height >= FONT_SIZE * 2) {
            _titleLabel.text = _live.title;
        }else {
            _titleLabel.text = [NSString stringWithFormat:@"%@\n", _live.title];
        }
        [_iconView setImageWithURL:[NSURL URLWithString:_live.liveCover.src] placeholderImage:nil];
    }
}

- (NSAttributedString *)attributeTitleString {
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@""];

    return nil;
//    return [[NSAttributedString alloc] initWithString:string attributes:@{}];
}

/*!
 *  单行时候 text 显示完整需要的宽度
 *
 *  @param text  text 内容
 *
 *  @return  text 宽度
 */
- (CGSize)stringWidthInSingleLine:(NSString *)text {
    CGSize size = [text boundingRectWithSize:self.frame.size
                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName: _titleLabel.font} context:nil].size;
    return size;
}

#pragma mark - Getter

- (UIImageView *)iconView {
    if (_iconView == nil) {
        self.iconView = [UIImageView new];
        _iconView.layer.cornerRadius = 5.0;
        _iconView.clipsToBounds = YES;
        _iconView.layer.borderColor = COLOR(220, 220, 220, 1).CGColor;
        _iconView.layer.borderWidth = 1.0;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 2;
        _titleLabel.textAlignment = NSTextAlignmentNatural;
        _titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    }
    return _titleLabel;
}

@end
