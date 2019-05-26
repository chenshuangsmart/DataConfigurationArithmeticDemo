//
//  ViewController.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/15.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "BinarySearchTree.h"
#import "BST.h"
#import "AVLTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self test1];
    
    // 打印一棵二叉树
//    [self test1];
    
    // 删节点
//    [self removeNode];
    
    // AVL树
    [self avlTreeTest];
}

// 打印一棵二叉树
- (void)test1 {
    NSArray *data = @[@7, @4, @9, @2, @5, @8, @11, @1, @3, @12,];
    
    BST *tree = [[BST alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    NSLog(@"tree = %@",tree);
}

// 删节点
- (void)removeNode {
    NSArray *data = @[@7, @4, @9, @2, @5, @8, @11, @3, @12, @1];
    
    BST *tree = [[BST alloc] init];
    for (int i = 0; i < data.count; i++) {
        [tree add:data[i]];
    }
    
    NSLog(@"tree = %@",tree);
    
    [tree remove:@7];
    
    NSLog(@"tree = %@",tree);
}

// AVL树
- (void)avlTreeTest {
    NSArray *datas = @[@67, @52, @92, @96, @53, @95, @13, @63, @34, @82, @76, @54, @9, @68, @39];
    
    AVLTree *avl = [[AVLTree alloc] init];
    
    // 添加节点
    for (int i = 0; i < datas.count; i++) {
        [avl add:datas[i]];
        NSLog(@"[ + %@ + ]",datas[i]);
        NSLog(@"%@",avl.description);
        NSLog(@"----------------------------");
    }
    
    // 删除节点
    for (int i = 0; i < datas.count; i++) {
        [avl remove:datas[i]];
        NSLog(@"[ + %@ + ]",datas[i]);
        NSLog(@"%@",avl.description);
        NSLog(@"----------------------------");
    }
}

@end
