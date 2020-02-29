//
//  Set.h
//  13_Set
//
//  Created by chenshuang on 2020/2/26.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Set : NSObject

- (int)size;

- (BOOL)isEmpty;

- (void)clear;

- (BOOL)contains:(id)element;

- (void)add:(id)element;

- (void)remove:(id)element;

- (void)traversal;

@end

NS_ASSUME_NONNULL_END
