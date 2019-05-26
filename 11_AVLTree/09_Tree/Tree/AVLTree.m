//
//  AVLTree.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/26.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "AVLTree.h"
#import "AVLNode.h"

@implementation AVLTree

/** 初始化 */
- (AVLNode *)createNode:(id)element parent:(AVLNode *)parent {
    return [[AVLNode alloc] initWithElement:element parent:parent];
}

/// 新添加节点之后的处理
- (void)afterAdd:(TreeNode *)node {
    while ((node = node.parent) != nil) {
        if ([self isBalanced:(AVLNode *)node]) {
            // 更新高度
            [self updateHeight:(AVLNode *)node];
        } else {
            // 恢复平衡
            [self rebalance2:(AVLNode *)node];
            // 整颗树恢复平衡
            break;
        }
    }
}

/** 删除节点后平衡二叉树 */
- (void)afterRemove:(TreeNode *)node {
    while ((node = node.parent) != nil) {
        if ([self isBalanced:(AVLNode *)node]) {
            // 更新高度
            [self updateHeight:(AVLNode *)node];
        } else {
            // 恢复平衡
            [self rebalance:(AVLNode *)node];
        }
    }
}

#pragma mark - 恢复平衡 - 法一

/**
 恢复平衡 - 法一
 @param grand 高度最低的那个不平衡节点
 */
- (void)rebalance:(AVLNode *)grand {
    AVLNode *parent = (AVLNode *)(grand.tallerChild);
    TreeNode *node = parent.tallerChild;
    
    if (parent.isLeftChild) {   // L
        if (node.isLeftChild) { // LL
            [self rotateRight:grand];
        } else {    // LR
            [self rotateLeft:parent];
            [self rotateRight:grand];
        }
    } else {    // R
        if (node.isLeftChild) { // RL
            [self rotateRight:parent];
            [self rotateLeft:grand];
        } else {    // RR
            [self rotateLeft:grand];
        }
    }
}

/** 左旋转 grand - 爷爷节点 */
- (void)rotateLeft:(AVLNode *)grand {
    TreeNode *parent = grand.right;
    TreeNode *child = parent.left;
    grand.right = child;
    parent.left = grand;
    [self afterRotate:grand parent:parent child:child];
}

/** 右旋转 */
- (void)rotateRight:(AVLNode *)grand {
    TreeNode *parent = grand.left;
    TreeNode *child = parent.right;
    grand.left = child;
    parent.right = grand;
    [self afterRotate:grand parent:parent child:child];
}

/** 更新节点*/
- (void)afterRotate:(TreeNode *)grand parent:(TreeNode *)parent child:(TreeNode *)child {
    // 让parent成为子树的根节点
    parent.parent = grand.parent;

    if (parent.isLeftChild) {
        grand.parent.left = parent;
    } else if (grand) {
        grand.parent.right = parent;
    } else {    // grand 是 root节点
        self.root = parent;
    }
    
    // 更新child的parent
    if (child != nil) {
        child.parent = grand;
    }
    
    // 更新grand的parent
    grand.parent = parent;
    
    // 更新高度
    [self updateHeight:(AVLNode *)grand];
    [self updateHeight:(AVLNode *)parent];
}

#pragma mark - 恢复平衡 - 法二

/**
 恢复平衡
 @param grand 高度最低的那个不平衡节点
 */
- (void)rebalance2:(AVLNode *)grand {
    AVLNode *parent = (AVLNode *)grand.tallerChild;
    AVLNode *node = (AVLNode *)parent.tallerChild;
    
    if (parent.isLeftChild) {   // L
        if (node.isLeftChild) { // LL
            [self rotate:grand a:node.left b:node c:node.right d:parent e:parent.right f:grand g:grand.right];
        } else {    // LR
            [self rotate:grand a:parent.left b:parent c:node.left d:node e:node.right f:grand g:grand.right];
        }
    } else {    // R
        if (node.isLeftChild) { // RL
            [self rotate:grand a:grand.left b:grand c:node.left d:node e:node.right f:parent g:parent.right];
        } else {    // RR
            [self rotate:grand a:grand.left b:grand c:parent.left d:parent e:node.left f:node g:node.right];
        }
    }
}

/// 旋转操作
- (void)rotate:(TreeNode *)r    // 子树的根节点
             a:(TreeNode *)a b:(TreeNode *)b c:(TreeNode *)c
             d:(TreeNode *)d
             e:(TreeNode *)e f:(TreeNode *)f g:(TreeNode *)g {
    // 让 d 成为这棵子树的根节点
    d.parent = r.parent;
    
    if (r.isLeftChild) {
        r.parent.left = d;
    } else if (r.isRightChild) {
        r.parent.right = d;
    } else {
        self.root = d;
    }
    
    // a-b-c
    b.left = a;
    if (a != nil) {
        a.parent = b;
    }
    b.right = c;
    if (c != nil) {
        c.parent = b;
    }
    [self updateHeight:b];
    
    // e-f-g
    f.left = e;
    if (e != nil) {
        e.parent = f;
    }
    f.right = g;
    if (g != nil) {
        g.parent = f;
    }
    [self updateHeight:f];
    
    // b-d-f
    d.left = b;
    d.right = f;
    b.parent = d;
    f.parent = d;
    [self updateHeight:d];
}

#pragma mark - private

/** 是否是平衡树 */
- (BOOL)isBalanced:(AVLNode *)node {
    return abs(node.balanceFactor) <= 1;
}

/** 更新子树高度 */
- (void)updateHeight:(AVLNode *)node {
    [node updateHeight];
}

@end
