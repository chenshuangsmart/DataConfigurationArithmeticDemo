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
    
    // fib test
//    [self fibTest];
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

- (void)fibTest {
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

#pragma mark - 时间复杂度

// O(1)
- (void)test1:(int)n {
    if (n > 10) {
        NSLog(@"n > 10");
    } else if (n > 5) { // 2
        NSLog(@"n > 5");
    } else {
        NSLog(@"n <= 5");
    }
    
    for (int i = 0; i < 4; i++) {
        NSLog(@"test1");
    }
}

// O(n)
- (void)test2:(int)n {
    // 1 + 3n (指令执行条数)
    // O(n)
    for (int i = 0; i < n; i++) {
        NSLog(@"test");
    }
}

// O(n^2)
- (void)test3:(int)n {
    // 1 + 2n + n * (1 + 3n) (指令执行条数)
    // 1 + 2n + n + 3n^2
    // 3n^2 + 3n + 1
    // O(n^2)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            NSLog(@"test");
        }
    }
}

// O(n)
- (void)test4:(int)n {
    // 1 + 2n + n * (1 + 45) (指令执行条数)
    // 1 + 2n + 46n
    // 48n + 1
    // O(n)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < 15; j++) {
            NSLog(@"test");
        }
    }
}

// O(logn)
- (void)test5:(int)n {
    // 执行次数 = log2(n)
    // O(logn)
    while ((n = n / 2) > 0) {
        NSLog(@"test");
    }
}

// O(logn)
- (void)test6:(int)n {
    // log5(n)
    // O(logn)
    while ((n = n / 5) > 0) {
        NSLog(@"test");
    }
}

// O(nlogn)
- (void)test7:(int)n {
    // 1 + 2*log2(n) + log2(n) * (1 + 3n)
    // 1 + 3*log2(n) + 3 * nlog2(n)
    // O(nlogn)
    for (int i = 1; i < n; i = i * 2) {
        // 1 + 3n
        for (int j = 0; j < n; j++) {
            NSLog(@"test");
        }
    }
}

// O(n+k)
- (void)test8:(int)n k:(int)k {
    for (int i = 0; i < n; i++) {
        NSLog(@"test8 %d",i);
    }
    
    for (int i = 0; i < k; i++) {
        NSLog(@"test8 %d",i);
    }
}

@end
