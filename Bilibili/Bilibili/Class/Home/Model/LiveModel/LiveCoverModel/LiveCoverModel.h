//
//  LiveCoverModel.h
//  Bilibili
//
//  Created by Apple-T on 16/9/21.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveCoverModel : NSObject

@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSString *src;

- (instancetype)initWithDataDic:(NSDictionary *)dataDic;

@end
