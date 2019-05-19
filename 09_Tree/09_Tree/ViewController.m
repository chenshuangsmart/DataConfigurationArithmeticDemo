//
//  ViewController.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/15.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "BinarySearchTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self test1];
    
    // 前序遍历
//    [self preorder];
    
    // 中序遍历
//    [self Inorder];
    
    // 后序遍历
//    [self postorder];
    
    // 层序遍历
//    [self levelOrder];
    
    // 打印二叉搜索树
//    [self printBinarySearchTree];
    
    // 计算二叉树的高度
//    [self getTreeHeight];
    
    /// 是否为完全二叉树
    [self isComplteBinaryTree];
}

// 打印一棵二叉树
- (void)test1 {
    NSArray *data = @[@7, @4, @9, @2, @5, @8, @11, @3, @12, @1];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    NSLog(@"tree = %@",tree);
}

#pragma mark - 遍历

/// 前序遍历
- (void)preorder {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    [tree preordr];
}

/// 中序遍历
- (void)Inorder {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    [tree inorder];
}

/// /后序遍历
- (void)postorder {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    [tree postorder];
}

/// 层序遍历
- (void)levelOrder {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    [tree levelOrder];
}

#pragma mark - 遍历的作用

/// 利用前序遍历树状打印二叉树
- (void)printBinarySearchTree {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    NSLog(@"%@",tree.description);
}

/// 计算二叉树的高度
- (void)getTreeHeight {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    NSLog(@"递归:%d",[tree getHeight]);
    NSLog(@"递归:%d",[tree getHeight2]);
}

/// 是否为完全二叉树
- (void)isComplteBinaryTree {
    NSArray *data = @[@7,@4,@9,@2,@5,@8,@11,@1,@3,@10,@12];
    NSArray *data1 = @[@7,@4,@9,@2,@5,@8,@11];
    NSArray *data2 = @[@7,@4,@9,@2,@5,@8,@11,@1];
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    BinarySearchTree *tree1 = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data1.count; i++) {
        [tree1 add:data1[i]];
    }
    BinarySearchTree *tree2 = [[BinarySearchTree alloc] init];
    for (int i = 0; i < data2.count; i++) {
        [tree2 add:data2[i]];
    }
    NSLog(@"%d",[tree isComplteBinaryTree]);
    NSLog(@"%d",[tree1 isComplteBinaryTree]);
    NSLog(@"%d",[tree2 isComplteBinaryTree]);
}

@end
