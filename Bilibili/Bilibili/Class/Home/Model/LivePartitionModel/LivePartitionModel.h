//
//  LivePartitionModel.h
//  Bilibili
//
//  Created by Apple-T on 16/9/21.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveSubIconModel.h"

@interface LivePartitionModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *count;

@property (nonatomic, strong) LiveSubIconModel *liveSubIcon;

- (instancetype)initWithDataDic:(NSDictionary *)dataDic;

@end
