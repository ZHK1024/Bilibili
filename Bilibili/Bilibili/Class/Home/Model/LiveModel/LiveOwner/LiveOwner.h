//
//  LiveOwner.h
//  Bilibili
//
//  Created by Apple-T on 16/9/21.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveOwner : NSObject

@property (nonatomic, strong) NSString *face;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *mid;

- (instancetype)initWithDataDic:(NSDictionary *)dataDic;

@end
