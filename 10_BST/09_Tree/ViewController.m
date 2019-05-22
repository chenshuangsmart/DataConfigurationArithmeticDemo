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
    [self removeNode];
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

@end
