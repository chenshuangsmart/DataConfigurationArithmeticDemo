//
//  List.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 数据结构基类
@interface List : NSObject

/**
 * 清除所有元素
 */
- (void)clear;

/**
 * 元素的数量
 * @return int
 */
- (int)size;

/**
 * 是否为空
 * @return bool
 */
- (bool)isEmpty;

/**
 * 是否包含某个元素
 * @param element
 * @return bool
 */
- (bool)contains:(id)element;

/**
 * 添加元素到尾部
 * @param element
 */
- (void)add:(id)element;

/**
 * 获取index位置的元素
 * @param index
 * @return id
 */
- (id)get:(NSUInteger)index;

/**
 * 设置index位置的元素
 * @param index
 * @param element
 * @return 原来的元素ֵ
 */
- (id)set:(NSUInteger)index element:(id)element;

/**
 * 在index位置插入一个元素
 * @param index
 * @param element
 */
- (void)add:(NSUInteger)index element:(id)element;

/**
 * 删除index位置的元素
 * @param index
 * @return
 */
- (id)remove:(NSUInteger)index;

/**
 * 查看元素的索引
 * @param element
 * @return
 */
- (NSUInteger)indexOf:(id)element;

@end

NS_ASSUME_NONNULL_END
