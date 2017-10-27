//
//  LiveModel.m
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel

- (instancetype)initWithDataDic:(NSDictionary *)dataDic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dataDic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"cover"]) {
        self.liveCover = [[LiveCoverModel alloc] initWithDataDic:value];
    }else if ([key isEqualToString:@"owner"]) {
        self.liveOwner = [[LiveOwner alloc] initWithDataDic:value];
    }
}

@end
