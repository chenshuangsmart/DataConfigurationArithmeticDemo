//
//  ViewController.m
//  13_Set
//
//  Created by chenshuang on 2020/2/26.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "ListSet.h"
#import "TreeSet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self listSetTest];
    
//    [self treeSetTest];
    
    [self getFileInfo];
}

- (void)listSetTest {
    ListSet *set = [[ListSet alloc] init];
    [set add:@10];
    [set add:@11];
    [set add:@11];
    [set add:@12];
    [set add:@10];
    
    [set traversal];
}

- (void)treeSetTest {
    TreeSet *treeSet = [[TreeSet alloc] init];
    [treeSet add:@12];
    [treeSet add:@10];
    [treeSet add:@7];
    [treeSet add:@11];
    [treeSet add:@10];
    [treeSet add:@11];
//    [treeSet add:@9];
    
    [treeSet traversal];
}

- (void)getFileInfo {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"txt"];
    NSFileManager* fm = [NSFileManager defaultManager];
    NSString* content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    ListSet *set = [[ListSet alloc] init];
    for (int i = 0; i < content.length; i++) {
        NSString *str = [content substringWithRange:NSMakeRange(i, 1)];
        
        if ([self judgeTheillegalCharacter:str]) {
            NSLog(@"包含非法符号:%@",str);
            continue;
        }
        NSLog(@"i = %d, str = %@",i, str);
        [set add:str];
    }
    [set traversal];
}

- (BOOL)judgeTheillegalCharacter:(NSString *)content{
    //提示 标签不能输入特殊字符
    NSString *str =@"[A-Za-z0-9]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:content]) {
        return YES;
    }
    return NO;
}

@end
