//
//  ViewController.m
//  16_Heap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "BinaryHeap.h"

@interface ViewController ()<BinaryHeapDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self test1];
    
//    [self test2];
    
    // 找出最大的前K个数
    [self test3];
}

- (void)test1 {
    BinaryHeap *heap = [[BinaryHeap alloc] init];
    int nums[] = {68,72,43,50,38,47,14,21,80};
    
    for (int i = 0; i < 8; i++) {
        [heap add:@(nums[i])];
    }
    
    [heap  print];
}

/// 建立小顶堆
- (void)test2 {
    BinaryHeap *heap = [[BinaryHeap alloc] init];
    heap.delegate = self;
//    int nums[] = {88, 44, 53, 41, 16, 6, 70, 18, 85, 98, 81, 23, 36, 43, 37};
    int nums[] = {51, 30, 39};
    
    int num = sizeof(nums) / sizeof(int);
    for (int i = 0; i < num; i++) {
        [heap add:@(nums[i])];
    }
    
    [heap  print];
}

// 找出最大的前K个数
- (void)test3 {
    // 新建一个小顶堆
    BinaryHeap *heap = [[BinaryHeap alloc] init];
    heap.delegate = self;
    int nums[] = {51, 30, 39, 92, 74, 25, 16, 93,
        91, 19, 54, 47, 73, 62, 76, 63, 35, 18,
        90, 6, 65, 49, 3, 26, 61, 21, 48};
    int k = 3;
    
    // 找出最大的前K个数
    int num = sizeof(nums) / sizeof(int);
    for (int i = 0; i < num; i++) {
        if (heap.size < k) {    // 前k个数添加到小顶堆
            [heap add:@(nums[i])];
        } else if (nums[i] > [[heap get] intValue]) {   // 如果是第 k + 1 个数，并且大于堆顶元素
            [heap replace:@(nums[i])];
        }
    }
    [heap print];
}


#pragma mark - BinaryHeapDelegate

- (int)compare:(NSNumber *)num1 num2:(NSNumber *)num2 {
    return num2.intValue - num1.intValue;
//    return num1.intValue - num2.intValue;
}

@end
