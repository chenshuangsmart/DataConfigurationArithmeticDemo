//
//  TimeTool.m
//  AlgorithmComplex_1
//
//  Created by chenshuang on 2019/4/23.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "TimeTool.h"

@implementation TimeTool

/// 计算执行完 block 所需花费时间
+ (void)calculateTimeWithTitle:(NSString *)title operationBlock:(void(^)(void))operationBlock {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:mmm"];
    NSDate *startDate = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:startDate];
    NSLog(@"%@ start, time = %@",title,currentTimeString);
    
    if (operationBlock) {
        operationBlock();
    }
    
    NSDate *endDate = [NSDate date];
    currentTimeString = [formatter stringFromDate:endDate];
    NSLog(@"%@ end, time = %@",title,currentTimeString);
    
    NSLog(@"%@ 耗时:%f second",title,[endDate timeIntervalSince1970] - [startDate timeIntervalSince1970]);
}

@end
