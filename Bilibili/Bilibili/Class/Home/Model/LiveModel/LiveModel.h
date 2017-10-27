//
//  LiveModel.h
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveOwner.h"
#import "LiveCoverModel.h"

@interface LiveModel : NSObject

@property (nonatomic, strong) NSNumber *room_id;
@property (nonatomic, strong) NSString *accept_quality;
@property (nonatomic, strong) NSNumber *check_version;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *area_id;
@property (nonatomic, strong) NSString *playurl;
@property (nonatomic, strong) NSNumber *is_tv;
@property (nonatomic, strong) NSNumber *online;
@property (nonatomic, strong) NSNumber *broadcast_type;

@property (nonatomic, strong) LiveCoverModel *liveCover;
@property (nonatomic, strong) LiveOwner      *liveOwner;

- (instancetype)initWithDataDic:(NSDictionary *)dataDic;

@end
