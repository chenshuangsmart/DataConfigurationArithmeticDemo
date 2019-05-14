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
#import "Deque.h"
#import "CircleQueue.h"
#import "CircleDeque.h"

@interface ViewController ()
/** list*/
@property(nonatomic,strong)LinkedList *list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 队列
//    [self queueTest];
    
    // 用栈实现队列操作
//    [self queueStackTest];
    
    //  双端队列
//    [self deQueueTest];
    
    // 循环队列测试
//    [self circleQueueTest];
    
    // 双端循环队列测试
    [self circleDequeTest];
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

//  双端队列
- (void)deQueueTest {
    Deque *qu = [[Deque alloc] init];
    [qu enQueueFront:@(11)];
    [qu enQueueFront:@(22)];
    [qu enQueueRear:@(33)];
    [qu enQueueRear:@(44)];
    
    /**  尾 44 33 11 22 */
    while (!qu.isEmpty) {
        NSLog(@"%@",[qu deQueueRear]);
    }
}

// 循环队列测试
- (void)circleQueueTest {
    CircleQueue *queue = [[CircleQueue alloc] init];
    // 0 1 2 3 4 5 6 7 8 9
    for (int i = 0; i < 10; i++) {
        [queue enQueue:@(i)];
    }
    NSLog(@"%@",[queue description]);
    
    // null null null null null 5 6 7 8 9
    for (int i = 0; i < 5; i++) {
        [queue deQueue];
    }
    NSLog(@"%@",[queue description]);
    
    // 15 16 17 18 19 5 6 7 8 9
    for (int i = 15; i < 20; i++) {
        [queue enQueue:@(i)];
    }
    NSLog(@"%@",[queue description]);
    
    while (!queue.isEmpty) {
        NSLog(@"%@",queue.deQueue);
    }
    
    NSLog(@"%@",[queue description]);
}

// 双端循环队列测试
- (void)circleDequeTest {
    CircleDeque *queue = [[CircleDeque alloc] init];
    
    // 头5 4 3 2 1  100 101 102 103 104 105 106 8 7 6 尾
    
    // 头 8 7 6  5 4 3 2 1  100 101 102 103 104 105 106 107 108 109 null null 10 9 尾
    for (int i = 0; i < 10; i++) {
        [queue enQueueFront:@(i + 1)];
        [queue enQueueRear:@(i + 100)];
    }
    NSLog(@"%@",[queue description]);
    
    // 头 null 7 6  5 4 3 2 1  100 101 102 103 104 105 106 null null null null null null null 尾
    for (int i = 0; i < 3; i++) {
        [queue deQueueFront];
        [queue deQueueRear];
    }
    NSLog(@"%@",[queue description]);
    
    // 头 11 7 6  5 4 3 2 1  100 101 102 103 104 105 106 null null null null null null 12 尾
    [queue enQueueFront:@(11)];
    [queue enQueueFront:@(12)];
    NSLog(@"%@",[queue description]);
    
    while (!queue.isEmpty) {
        NSLog(@"%@",queue.deQueueFront);
    }
    
    NSLog(@"%@",[queue description]);
}

@end
