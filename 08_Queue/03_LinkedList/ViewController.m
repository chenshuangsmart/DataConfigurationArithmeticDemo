//
//  ViewController.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "LinkList/LinkedList.h"
#import "SingleCircleLinkedList.h"
#import "DoubleCircleLinkedList.h"
#import "Queue.h"
#import "QueueStack.h"

@interface ViewController ()
/** list*/
@property(nonatomic,strong)LinkedList *list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 队列
    [self queueTest];
    
    // 用栈实现队列操作
//    [self queueStackTest];
}

/// queue test
- (void)queueTest {
    Queue *qu = [[Queue alloc] init];
    [qu enQueue:@(11)];
    [qu enQueue:@(22)];
    [qu enQueue:@(33)];
    [qu enQueue:@(44)];
    
    while (!qu.isEmpty) {
        NSLog(@"%@",[qu deQueue]);
    }
}

// 用栈实现队列操作
- (void)queueStackTest {
    Queue *qu = [[Queue alloc] init];
    [qu enQueue:@(11)];
    [qu enQueue:@(22)];
    [qu deQueue];
    [qu enQueue:@(33)];
    [qu deQueue];
    
    while (!qu.isEmpty) {
        NSLog(@"%@",[qu deQueue]);
    }
}

@end
