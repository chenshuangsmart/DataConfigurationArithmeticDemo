//
//  Person.h
//  15_HashMap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
/** age */
@property(nonatomic,assign)int age;
/** height */
@property(nonatomic,assign)float height;
/** name */
@property(nonatomic,strong)NSString *name;

/// 初始化
- (instancetype)initWithAge:(int)age height:(float)height name:(NSString *)name;

/// 用来比较两个对象是否相对
- (BOOL)equals:(id)obj;

/// hash code
- (int)hasCode;

/// 年龄比较
- (int)compartTo:(Person *)per;

@end

NS_ASSUME_NONNULL_END
