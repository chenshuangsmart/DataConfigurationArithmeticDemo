//
//  TimeTool.h
//  AlgorithmComplex_1
//
//  Created by chenshuang on 2019/4/23.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 时间工具类
@interface TimeTool : NSObject

/// 计算执行完 block 所需花费时间
+ (void)calculateTimeWithTitle:(NSString *)title operationBlock:(void(^)(void))operationBlock;

@end

NS_ASSUME_NONNULL_END
