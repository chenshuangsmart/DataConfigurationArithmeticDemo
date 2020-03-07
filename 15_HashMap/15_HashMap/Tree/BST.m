//
//  BST.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/21.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "BST.h"

@implementation BST

/**
 * 清除所有元素
 */
- (void)clear {
    self.root = nil;
    self.size = 0;
}

/**
 * 是否包含某个元素
 * @param element
 * @return bool
 */
- (bool)contains:(id)element {
    return [self node:element] != nil;
}

/** 初始化 */
- (TreeNode *)createNode:(id)element parent:(TreeNode *)parent {
    return [[TreeNode alloc] initWithElement:element parent:parent];
}

/**
 * 添加元素到尾部
 * @param element
 */
- (void)add:(id)element {
    [self elementNotNullCheck:element];
    
    // 添加第一个节点
    if (self.root == nil) {
        self.root = [self createNode:element parent:nil];
        self.size++;
        
        /// 新添加节点之后的处理
        [self afterAdd:self.root];
        return;
    }
    
    // 添加的不是第一个节点
    // 找到父节点
    TreeNode *parent = self.root;
    TreeNode *node = self.root;
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
    TreeNode *newNode = [self createNode:element parent:parent];
    if (cmp > 0) {
        parent.right = newNode;
    } else {
        parent.left = newNode;
    }
    self.size++;
    
    /// 添加节点之后的处理
    [self afterAdd:newNode];
}

/**
 * 删除元素
 * @param element
 */
- (void)remove:(id)element {
    [self removeNode:[self node:element]];
}

/// 删除节点 node
- (void)removeNode:(TreeNode *)node {
    if (node == nil) {
        return;
    }
    
    self.size--;
    
    if (node.hasTwoChildren) {  // 度为2的节点
        // 找到后继节点
        TreeNode *s = [self successor:node];
        // 用后继节点的值覆盖度为2的节点的值
        node.element = s.element;
        // 删除后继节点
        node = s;
    }
    
    // 删除node节点(node的度必然是1或者0)
    TreeNode *replacement = node.left != nil ? node.left : node.right;
    
    if (replacement != nil) {   // 1.node是度为1的节点
        // 更改parent
        replacement.parent = node.parent;
        // 更改parent的left,right的指向
        if (node.parent == nil) {   // node是度为1的节点并且是根节点
            self.root = replacement;
        } else if (node == node.parent.left) {  // 左子节点
            node.parent.left = replacement;
        } else {    // node == node.parent.right
            node.parent.right = replacement;
        }
    } else if (node.parent == nil) {    // 2.node是叶子节点并且是根节点
        self.root = nil;
    } else {    // 3.node是叶子节点,但不是根节点
        if (node == node.parent.left) {
            node.parent.left = nil;
        } else {    // node == node.parent.right
            node.parent.right = nil;
        }
    }
    
    /// 删除节点之后的处理
    [self afterRemove:node];
}

- (NSString *)description {
    return [super description];
}

#pragma mark - 平衡二叉树 - 子类实现

/** 添加节点后平衡二叉树 */
- (void)afterAdd:(TreeNode *)node {

}

/** 删除节点后平衡二叉树 */
- (void)afterRemove:(TreeNode *)node {
    
}

@end
