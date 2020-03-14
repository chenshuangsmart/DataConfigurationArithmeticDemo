//
//  AbstractHeap.m
//  16_Heap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "AbstractHeap.h"

@implementation AbstractHeap

- (bool)isEmpty {
    return _size == 0;
}

- (int)compare:(NSNumber *)num1 num2:(NSNumber *)num2 {
    return num1.intValue - num2.intValue;
}

@end
