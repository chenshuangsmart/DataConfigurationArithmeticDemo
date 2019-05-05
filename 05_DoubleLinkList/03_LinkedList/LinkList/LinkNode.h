//
//  LinkNode.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 链表节点
@interface LinkNode : NSObject

/** element*/
@property(nonatomic,assign)id element;

/** next*/
@property(nonatomic,strong)LinkNode *next;
/** next*/
@property(nonatomic,strong)LinkNode *prev;

- (instancetype)initWithPrev:(LinkNode *)prev element:(id)element next:(LinkNode *)next;

@end

NS_ASSUME_NONNULL_END
