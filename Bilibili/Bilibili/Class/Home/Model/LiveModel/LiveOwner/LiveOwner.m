//
//  LiveOwner.m
//  Bilibili
//
//  Created by Apple-T on 16/9/21.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "LiveOwner.h"

@implementation LiveOwner

- (instancetype)initWithDataDic:(NSDictionary *)dataDic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dataDic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

@end
