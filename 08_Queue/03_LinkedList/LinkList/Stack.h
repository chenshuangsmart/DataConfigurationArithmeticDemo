//
//  Stack.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/12.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject

/// 长度
- (int)size;

/// 是否为空
- (bool)isEmpty;

/// 入栈
- (void)push:(id)element;

/// 出栈
- (id)pop;

/// 返回栈顶元素
- (id)top;

@end

NS_ASSUME_NONNULL_END
