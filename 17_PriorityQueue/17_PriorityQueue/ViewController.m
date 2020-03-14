//
//  ViewController.m
//  17_PriorityQueue
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "PriorityQueue.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
}

- (void)test1 {
    PriorityQueue *queue = [[PriorityQueue alloc] init];
//    [queue enQueue:[[Person alloc] initWithAge:2 height:100 name:@"Jack"]];
//    [queue enQueue:[[Person alloc] initWithAge:5 height:100 name:@"Rose"]];
//    [queue enQueue:[[Person alloc] initWithAge:5 height:100 name:@"Jake"]];
//    [queue enQueue:[[Person alloc] initWithAge:15 height:100 name:@"James"]];
    
    [queue enQueue:@(2)];
    [queue enQueue:@(10)];
    [queue enQueue:@(5)];
    [queue enQueue:@(15)];
    
    while (!queue.isEmpty) {
        NSLog(@"%@",queue.deQueue);
    }
}

@end
