//
//  BST.h
//  09_Tree
//
//  Created by chenshuang on 2019/5/21.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "BinarySearchTree.h"

NS_ASSUME_NONNULL_BEGIN

/**
 二叉树搜索树
 */
@interface BST : BinarySearchTree

/**
 * 清除所有元素
 */
- (void)clear;

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
 * 删除元素
 * @param element
 */
- (void)remove:(id)element;

@end

NS_ASSUME_NONNULL_END
