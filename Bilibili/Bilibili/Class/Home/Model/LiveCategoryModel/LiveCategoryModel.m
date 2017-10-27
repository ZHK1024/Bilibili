//
//  LiveCategoryModel.m
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "LiveCategoryModel.h"

@implementation LiveCategoryModel

- (instancetype)initWithDataDic:(NSDictionary *)dataDic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dataDic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"lives"]) {
        [self makeLiveModelWithData:value];
    }else if ([key isEqualToString:@"partition"]) {
        self.livePartitionl = [[LivePartitionModel alloc] initWithDataDic:value];
    }
}

- (void)makeLiveModelWithData:(NSArray *)data {
    for (NSDictionary *dataDic in data) {
        LiveModel *live = [[LiveModel alloc] initWithDataDic:dataDic];
        [self.livesArray addObject:live];
    }
}

#pragma mark - Getter

- (NSMutableArray<LiveModel *> *)livesArray {
    if (_livesArray == nil) {
        self.livesArray = [NSMutableArray new];
    }
    return _livesArray;
}

@end
