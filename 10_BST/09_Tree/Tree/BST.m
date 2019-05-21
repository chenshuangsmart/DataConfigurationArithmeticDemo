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

/**
 * 添加元素到尾部
 * @param element
 */
- (void)add:(id)element {
    [self elementNotNullCheck:element];
    
    // 添加第一个节点
    if (self.root == nil) {
        self.root = [[TreeNode alloc] initWithElement:element parent:nil];
        self.size++;
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
    TreeNode *newNode = [[TreeNode alloc] initWithElement:element parent:parent];
    if (cmp > 0) {
        parent.right = newNode;
    } else {
        parent.left = newNode;
    }
    self.size++;
}

/**
 * 删除元素
 * @param element
 */
- (void)remove:(id)element {
    
}

- (NSString *)description {
    return [super description];
}
@end
