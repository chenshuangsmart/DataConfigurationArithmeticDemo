//
//  ArrayList.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/12.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractList.h"

NS_ASSUME_NONNULL_BEGIN

/**
 可变数组
 */
@interface ArrayList : AbstractList

/** 初始化 */
- (instancetype)initWithCapaticy:(int)capaticy;

@end

NS_ASSUME_NONNULL_END
