//
//  LiveCategoryModel.h
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveModel.h"
#import "LivePartitionModel.h"

@interface LiveCategoryModel : NSObject

@property (nonatomic, strong) NSMutableArray<LiveModel *>   *livesArray;
@property (nonatomic, strong) LivePartitionModel            *livePartitionl;

- (instancetype)initWithDataDic:(NSDictionary *)dataDic;

@end
