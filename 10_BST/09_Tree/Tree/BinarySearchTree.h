//
//  BinarySearchTree.h
//  09_Tree
//
//  Created by chenshuang on 2019/5/19.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

NS_ASSUME_NONNULL_BEGIN

/**
 二叉树
 */
@interface BinarySearchTree : NSObject

/** root*/
@property(nonatomic,strong)TreeNode *root;
/** size*/
@property(nonatomic,assign)int size;

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
 * 删除元素为element的节点
 * @param element
 */
- (void)removeElement:(id)element;

/**
 * 删除节点为node的节点
 * @param node
 */
- (void)removeNode:(TreeNode *)node;

/**
 * 返回元素为element的节点
 * @param element
 * @return
 */

- (TreeNode *)node:(id)element;

/**
 * 查看元素的索引
 * @param element
 * @return
 */
- (NSUInteger)indexOf:(id)element;

/** 校验元素是否为空 */
- (void)elementNotNullCheck:(id)element;

/** 比较两元素的大小 */
- (int)compare:(id)element1 element2:(id)element2;

/** 返回根节点 */
- (TreeNode *)root;

#pragma mark - 遍历

/// 前序遍历
- (void)preordr;

/// 中序遍历
- (void)inorder;

/// 后序遍历
- (void)postorder;

/// 层序遍历
- (void)levelOrder;

#pragma mark - 遍历的作用

/// 计算二叉树的高度 - 递归实现
- (int)getHeight;

/// 计算二叉树的高度 - 迭代实现
- (int)getHeight2;

/// 是否为完全二叉树
- (BOOL)isComplteBinaryTree;

#pragma mark - 前驱节点 和 后继节点

/// 找前驱节点
- (TreeNode *)predecessor:(TreeNode *)node;

/// 找后继节点
- (TreeNode *)successor:(TreeNode *)node;

@end

NS_ASSUME_NONNULL_END
