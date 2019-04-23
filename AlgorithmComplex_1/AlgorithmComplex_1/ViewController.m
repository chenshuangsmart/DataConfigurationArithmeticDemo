//
//  ViewController.m
//  AlgorithmComplex_1
//
//  Created by chenshuang on 2019/4/22.
//  Copyright © 2019年 wenwen. All rights reserved.
//  数据结构与算法之复杂度

#import "ViewController.h"
#import "TimeTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int n = 44;
    // fib1
    [TimeTool calculateTimeWithTitle:@"fib1" operationBlock:^{
        [self fib1:n];
    }];
    
    // fib2
    [TimeTool calculateTimeWithTitle:@"fib2" operationBlock:^{
        [self fib2:n];
    }];
}

// 计算a和b的和
- (int)plus:(int)a b:(int)b {
    return a + b;
}

// 计算 1+2+3+...+n 的和
- (int)sum:(int)n {
    int result = 0;
    for (int i = 1; i<= n; i++) {
        result += i;
    }
    return result;
}

// 计算 1+2+3+...+n 的和
- (int)sum1:(int)n {
    return (1 + n) * n / 2;
}

#pragma mark - 斐波那契数

// 递归
- (int)fib1:(int)n {
    if (n <= 1) {
        return n;
    }
    // Fn = Fn-1 + Fn-2（n >= 2，n∈N*）
    return [self fib1:n - 1] + [self fib1:n - 2];
}

// 直接求值
- (int)fib2:(int)n {
    if (n <= 1) {
        return n;
    }
    
    int first = 0;
    int second = 0;
    // Fn = Fn-1 + Fn-2
    for (int i = 1; i < n; i++) {
        second += first;
        first = second - first;
    }
    
    return second;
}

@end
