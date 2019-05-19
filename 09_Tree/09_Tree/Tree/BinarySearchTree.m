//
//  BinarySearchTree.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/19.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "BinarySearchTree.h"
#import "TreeNode.h"
#import "Queue.h"

@implementation BinarySearchTree {
    int _size;
    TreeNode *_root;
}

/** 返回根节点 */
- (TreeNode *)root {
    return _root;
}

/**
 * 清除所有元素
 */
- (void)clear {
    _root = nil;
    _size = 0;
}

/**
 * 元素的数量
 * @return int
 */
- (int)size {
    return _size;
}

/**
 * 是否为空
 * @return bool
 */
- (bool)isEmpty {
    return _size == 0;
}

/**
 * 是否包含某个元素
 * @param element
 * @return bool
 */
- (bool)contains:(id)element {
    return [self node:element] != nil;
}

/**
 * 添加元素到尾部
 * @param element
 */
- (void)add:(id)element {
    [self elementNotNullCheck:element];
    
    // 添加第一个节点
    if (_root == nil) {
        _root = [[TreeNode alloc] initWithElement:element parent:nil];
        _size++;
        return;
    }
    
    // 添加的不是第一个节点
    // 找到父节点
    TreeNode *parent = _root;
    TreeNode *node = _root;
    int cmp = 0;
    
    while (node != nil) {
        cmp = [self compare:element element2:node.element];
        parent = node;
        
        if (cmp > 0) {  // 右节点
            node = node.right;
        } else if (cmp < 0) {   // 左节点
            node = node.left;
        } else {    // 相对 - 覆盖
            node.element = element;
            return;
        }
    }
    
    // 查看插入到父节点的哪个位置
    TreeNode *newNode = [[TreeNode alloc] initWithElement:element parent:parent];
    if (cmp > 0) {
        parent.right = newNode;
    } else {
        parent.left = newNode;
    }
    _size++;
}

/**
 * 获取index位置的元素
 * @param index
 * @return id
 */
//- (id)get:(NSUInteger)index;

/**
 * 设置index位置的元素
 * @param index
 * @param element
 * @return 原来的元素ֵ
 */
//- (id)set:(NSUInteger)index element:(id)element;

/**
 * 删除元素为element的节点
 * @param element
 */
- (void)removeElement:(id)element {
    [self removeNode:[self node:element]];
}

/**
 * 删除节点为node的节点
 * @param node
 */

- (void)removeNode:(TreeNode *)node {
    if (node == nil) {
        return;
    }
    _size--;
    
    // 度为2的节点
    if (node.hasTwoChildren) {
        // 找到后继节点
        
    }
}

/**
 * 返回元素为element的节点
 * @param element
 * @return
 */

- (TreeNode *)node:(id)element {
    TreeNode *node = _root;
    int cmp = 0;
    while (node != nil) {
        cmp = [self compare:element element2:node.element];
        if (cmp == 0) { // 当前节点
            return node;
        } else if (cmp > 0) {   // 右子树
            node = node.right;
        } else {    // 左子树
            node = node.left;
        }
    }
    return nil;
}

/**
 * 查看元素的索引
 * @param element
 * @return
 */
//- (NSUInteger)indexOf:(id)element;

//- (NSString *)description {
//
//}

#pragma mark - 二叉树遍历

/// 前序遍历
- (void)preordr {
    [self preorder:_root];
}

/// 前序遍历
- (void)preorder:(TreeNode *)node {
    if (node == nil) {
        return;
    }
    
    NSLog(@"%@",node.description);
    [self preorder:node.left];
    [self preorder:node.right];
}

/// 中序遍历
- (void)inorder {
    [self inorder:_root];
}

/// 中序遍历
- (void)inorder:(TreeNode *)node {
    if (node == nil) {
        return;
    }
    [self inorder:node.left];
    NSLog(@"%@",node.description);
    [self inorder:node.right];
}

/// 后序遍历
- (void)postorder {
    [self postorder:_root];
}

/// 后序遍历
- (void)postorder:(TreeNode *)node {
    if (node == nil) {
        return;
    }
    [self postorder:node.left];
    [self postorder:node.right];
    NSLog(@"%@",node.description);
}

/// 层序遍历
- (void)levelOrder {
    if (_root == nil) {
        return;
    }
    
    Queue *queue = [[Queue alloc] init];
    [queue enQueue:_root];
    
    while (!queue.isEmpty) {
        TreeNode *node = [queue deQueue];
        NSLog(@"%@",node.description);
        
        if (node.left != nil) { // 左子节点入队
            [queue enQueue:node.left];
        }
        
        if (node.right != nil) {    // 右子节点入队
            [queue enQueue:node.right];
        }
    }
}

#pragma mark - 遍历的作用

/// 计算二叉树的高度 - 递归实现
- (int)getHeight {
    return [self height:_root];
}

- (int)height:(TreeNode *)node {
    if (node == nil) {
        return 0;
    }
    return 1 + MAX([self height:node.left], [self height:node.right]);
}

/// 计算二叉树的高度 - 迭代实现 - 层序遍历
- (int)getHeight2 {
    if (_root == nil) {
        return 0;
    }
    
    int height = 0; // 树的高度
    int levelSize = 1;  // 存储着每一层的元素数量
    
    Queue *qu = [[Queue alloc] init];
    [qu enQueue:_root];
    
    // 遍历队列
    while (!qu.isEmpty) {
        TreeNode *node = qu.deQueue;
        levelSize--;
        
        if (node.left != nil) {
            [qu enQueue:node.left];
        }
        
        if (node.right != nil) {
            [qu enQueue:node.right];
        }
        
        if (levelSize == 0) {   // // 意味着即将要访问下一层
            levelSize = qu.size;
            height++;
        }
    }
    
    return height;
}

/// 是否为完全二叉树
- (BOOL)isComplteBinaryTree {
    if (_root == nil) {
        return false;
    }
    
    Queue *qu = [[Queue alloc] init];
    [qu enQueue:_root];
    
    BOOL leaf = false;  // 是否为叶子节点
    while (!qu.isEmpty) {
        TreeNode *node = qu.deQueue;
        
        if (leaf && !node.isLeaf) { // 处于最后一层了,要求是叶子节点才可以
            return false;
        }
        
        if (node.hasTwoChildren) {  // 有左右子树 - 都入队
            [qu enQueue:node.left];
            [qu enQueue:node.right];
        } else if (node.left == nil && node.right != nil) { // 如果只有一个叶子节点,必须在左边才行
            return false;
        } else {    // 后面遍历的节点都必须是叶子节点
            leaf = true;
        }
    }
    
    return true;
}

#pragma mark - pricate

/** 校验元素是否为空 */
- (void)elementNotNullCheck:(id)element {
    // 如果节点上的元素为空,直接报错
    if (element == nil) {
        NSLog(@"element = %@",element);
        exit(0);    // 强制中断执行
    }
}

/** 比较两元素的大小 */
- (int)compare:(id)element1 element2:(id)element2 {
    NSNumber *num1 = (NSNumber *)element1;
    NSNumber *num2 = (NSNumber *)element2;
    
    return num1.intValue - num2.intValue;
}

#pragma mark - 打印

- (NSString *)description {
    NSMutableString *strM = [NSMutableString stringWithString:@"\n"];
    NSMutableString *prefix = [NSMutableString string];
    [self toString:_root strM:strM prefix:prefix];
    return strM.copy;
}

- (void)toString:(TreeNode *)node strM:(NSMutableString *)strM prefix:(NSMutableString *)prefix {
    if (node == nil) {
        return;
    }
    
    // 前序遍历二叉树
    [self toString:node.left strM:strM prefix:[NSMutableString stringWithFormat:@"%@%@",prefix,@"L_"]];
    [strM appendString:[NSString stringWithFormat:@"%@%@ \n",prefix,node.element]];
    [self toString:node.right strM:strM prefix:[NSMutableString stringWithFormat:@"%@%@",prefix,@"R_"]];
}

@end
