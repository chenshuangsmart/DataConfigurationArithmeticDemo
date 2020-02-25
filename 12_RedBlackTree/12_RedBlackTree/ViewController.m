//
//  ViewController.m
//  12_RedBlackTree
//
//  Created by chenshuang on 2020/1/11.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "AVLTree.h"
#import "BST.h"
#import "LinkedList.h"
#import "RBTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test1];
    
//    [self test2];
    
//    [self test3];
    
    [self test4];
}

- (void)test1 {
    NSInteger datas[] = {67, 52, 92, 96, 53, 95, 13, 63, 34, 82, 76, 54, 9, 68, 39};
    
    AVLTree *avl = [[AVLTree alloc] init];
    for (int i = 0; i < 15; i++) {
        [avl add:@(datas[i])];
    }
    
    [avl preordr];
}

- (void)test2 {
    // 构建随机数
    LinkedList *list = [[LinkedList alloc] init];
    for (int i = 0; i < 1000; i++) {
        [list add:@(arc4random())];
    }
    NSDate *date = [NSDate date];
    NSLog(@"%f",[date timeIntervalSince1970]);
    
    // BST
    BST *bst = [[BST alloc] init];
    for (int i = 0; i < list.size; i++) {   // add
        [bst add:[list get:i]];
    }
    for (int i = 0; i < list.size; i++) {   // contains
        [bst contains:[list get:i]];
    }
    for (int i = 0; i < list.size; i++) {
        [bst remove:[list get:i]];
    }
    NSLog(@"%f",[date timeIntervalSince1970]);
    // AVLTree
    AVLTree *avl = [[AVLTree alloc] init];
    for (int i = 0; i < list.size; i++) {   // add
        [avl add:[list get:i]];
    }
    for (int i = 0; i < list.size; i++) {   // contains
        [avl contains:[list get:i]];
    }
    for (int i = 0; i < list.size; i++) {
        [avl remove:[list get:i]];
    }
    NSLog(@"%f",[date timeIntervalSince1970]);
}

- (void)test3 {
    int numbers[] = {55, 87, 56, 74, 96, 22, 62, 20, 70, 68, 90, 50};
    
    RBTree *rb = [[RBTree alloc] init];
    for (int i = 0; i < 12; i++) {
        [rb add:@(numbers[i])];
    }
    
    [rb preordr];
}

- (void)test4 {
    int numbers[] = {55, 87, 56, 74, 96, 22, 62, 20, 70, 68, 90, 50};
    
    RBTree *rb = [[RBTree alloc] init];
    for (int i = 0; i < 12; i++) {
        [rb add:@(numbers[i])];
    }
    
    [rb preordr];
    
    for (int i = 0; i < 12; i++) {
        [rb remove:@(numbers[i])];
        NSLog(@"[%d]",numbers[i]);
        [rb preordr];
        NSLog(@"-------------");
    }
}

@end
