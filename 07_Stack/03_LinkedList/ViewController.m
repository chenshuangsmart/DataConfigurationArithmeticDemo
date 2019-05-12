//
//  ViewController.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "LinkList/LinkedList.h"
#import "SingleCircleLinkedList.h"
#import "DoubleCircleLinkedList.h"
#import "ArrayList.h"
#import "Stack.h"

@interface ViewController ()
/** list*/
@property(nonatomic,strong)LinkedList *list;
/** map*/
@property(nonatomic,strong)NSDictionary *map;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 双向链表测试
//    [self doubleLinkedListTest];
    
    // 单向循环链表测试
//    [self singleCircleLinkedListTest];
    
    // 双向循环链表测试
//    [self doubleCircleLinkedListTest];
    
    // 约瑟夫问题
//    [self josephus];
    
    // 数组
//    [self arrayListTest];
    
    // 栈测试
//    [self stackTest];
    
// 括号有效性匹配
NSArray *strs = @[@"{{({[]})}}",
                  @"{[}",
                  @"}()[]"];
for (NSString *str in strs) {
    NSLog(@"%@ is valid %d",str,[self bracketValid:str]);
}
    
    /**
    NSLog(@"-------递归反转链表---------");
    // 递归反转链表
    LinkNode *headNode = [self reverseList:list.first];
    NSLog(@"%@",headNode.description);
     */
    
    /**
    NSLog(@"-------迭代(非递归)反转链表---------");
    // 递归反转链表
    LinkNode *headNode = [self reverseList2:list.first];
    NSLog(@"%@",headNode.description);
     */
    
    // 环形链表
    /**
    LinkNode *lastNode = list.last;
    lastNode.next = list.first.next;
//    NSLog(@"%@",list.first.description);  // 不打印,因为一直在循环中
    bool hasCycle = [self hasCycle:list.first];
    NSLog(@"是否有环:%d",hasCycle);
     */
}

// 递归反转链表
- (LinkNode *)reverseList:(LinkNode *)head {
    if (head == nil || head.next == nil) {
        return head;
    }
    
    // 递归实现
    LinkNode *newHead = [self reverseList:head.next];
    head.next.next = head;
    head.next = nil;
    return newHead;
}

// 迭代(非递归)反转链表
- (LinkNode *)reverseList2:(LinkNode *)head {
    if (head == nil || head.next == nil) {
        return head;
    }
    
    LinkNode *newHead = nil;
    while (head) {
        LinkNode *tmp = head.next;
        head.next = newHead;
        newHead = head;
        head = tmp;
        NSLog(@"head:%@",head.description);
        NSLog(@"newHead:%@",newHead.description);
        NSLog(@"--------------------");
    }
    
    return newHead;
}

// 环形链表
- (bool)hasCycle:(LinkNode *)head {
    if (head == nil || head.next == nil) {
        return false;
    }
    
    LinkNode *slow = head;
    LinkNode *fast = head.next;
    
    while (fast != nil && fast.next != nil) {
        slow = slow.next;
        fast = fast.next.next;
        
        if (slow == fast) {
            return true;
        }
    }
    
    return fast;
}

#pragma mark - 双向链表

- (void)doubleLinkedListTest {
    LinkedList *list = [[LinkedList alloc] init];
    self.list = list;
    [list add:@11];
    [list add:@22];
    [list add:@33];
    [list add:@44]; // [11, 22, 33, 44]
    
    [list add:0 element:@55];   // [55, 11, 22, 33, 44]
    [list add:2 element:@66];   // [55, 11, 66, 22, 33, 44]
    [list add:list.size  element:@77];  // [55, 11, 66, 22, 33, 44, 77]
    
    [list remove:0];    // size = 6 [11, 66, 22, 33, 44, 77]
    [list remove:2];    // size = 5 [11, 66, 33, 44, 77]
    [list remove:list.size - 1];    // size = 4 [11, 66, 33, 44]
    
    NSLog(@"%lu",(unsigned long)[list indexOf:@44]);    // 3
    NSLog(@"%lu",(unsigned long)[list indexOf:@22]);    // NSNotFound
    NSLog(@"%lu",(unsigned long)[list contains:@33]);   // true
    NSLog(@"%@",[list get:0]);  // 11
    NSLog(@"%@",[list get:1]);  // 66
    NSLog(@"%@",[list get:list.size - 1]);  // 4
    
    NSLog(@"%@",list.description);
}

#pragma mark - 单向循环链表

- (void)singleCircleLinkedListTest {
    SingleCircleLinkedList *list = [[SingleCircleLinkedList alloc] init];
    [list add:@11];
    [list add:@22];
    [list add:@33];
    [list add:@44]; // [11, 22, 33, 44]
    
    NSLog(@"第一次打印: %@",list.description);
    
    [list add:0 element:@55];   // [55, 11, 22, 33, 44]
    [list add:2 element:@66];   // [55, 11, 66, 22, 33, 44]
    [list add:list.size  element:@77];  // [55, 11, 66, 22, 33, 44, 77]
    
    NSLog(@"第二次打印: %@",list.description);
    
    [list remove:0];    // size = 6 [11, 66, 22, 33, 44, 77]
    [list remove:2];    // size = 5 [11, 66, 33, 44, 77]
    [list remove:list.size - 1];    // size = 4 [11, 66, 33, 44]
    
    NSLog(@"第三次打印: %@",list.description);
    NSLog(@"----------------");
    NSLog(@"%lu",(unsigned long)[list indexOf:@44]);    // 3
    NSLog(@"%lu",(unsigned long)[list indexOf:@22]);    // NSNotFound
    NSLog(@"%lu",(unsigned long)[list contains:@33]);   // true
    NSLog(@"%@",[list get:0]);  // 11
    NSLog(@"%@",[list get:1]);  // 66
    NSLog(@"%@",[list get:list.size - 1]);  // 4
    
    NSLog(@"%@",list.description);
}

#pragma mark - 双向循环链表

- (void)doubleCircleLinkedListTest {
    DoubleCircleLinkedList *list = [[DoubleCircleLinkedList alloc] init];
    [list add:@11];
    [list add:@22];
    [list add:@33];
    [list add:@44]; // [11, 22, 33, 44]
    
    NSLog(@"第一次打印: %@",list.description);
    
    [list add:0 element:@55];   // [55, 11, 22, 33, 44]
    [list add:2 element:@66];   // [55, 11, 66, 22, 33, 44]
    [list add:list.size  element:@77];  // [55, 11, 66, 22, 33, 44, 77]
    
    NSLog(@"第二次打印: %@",list.description);
    
    [list remove:0];    // size = 6 [11, 66, 22, 33, 44, 77]
    [list remove:2];    // size = 5 [11, 66, 33, 44, 77]
    [list remove:list.size - 1];    // size = 4 [11, 66, 33, 44]
    
    NSLog(@"第三次打印: %@",list.description);
    NSLog(@"----------------");
    NSLog(@"%lu",(unsigned long)[list indexOf:@44]);    // 3
    NSLog(@"%lu",(unsigned long)[list indexOf:@22]);    // NSNotFound
    NSLog(@"%lu",(unsigned long)[list contains:@33]);   // true
    NSLog(@"%@",[list get:0]);  // 11
    NSLog(@"%@",[list get:1]);  // 66
    NSLog(@"%@",[list get:list.size - 1]);  // 4
    
    NSLog(@"%@",list.description);
}

#pragma mark - 约瑟夫问题

- (void)josephus {
    DoubleCircleLinkedList *list = [[DoubleCircleLinkedList alloc] init];
    for (int i = 1; i <= 8; i++) {
        [list add:@(i)];
    }
    
    // 指向头结点
    [list reset];
    
    // 开始递归循环
    while (![list isEmpty]) {
        [list next];
        [list next];    // 走两步
        NSLog(@"%@",[list remove]);
    }
}

#pragma mark - 数组

- (void)arrayListTest {
    ArrayList *list = [[ArrayList alloc] init];
    NSLog(@"%@",[list description]);
}

#pragma mark - 栈测试

- (void)stackTest {
    Stack *stack = [[Stack alloc] init];
    [stack push:@11];
    [stack push:@12];
    [stack push:@13];
    [stack push:@14];
    
    while (!stack.isEmpty) {
        NSLog(@"%@",stack.pop);
    }
}


// 括号有效性匹配
- (bool)bracketValid:(NSString *)bracket {
    Stack *sta = [[Stack alloc] init];
    
    for (int i = 0; i < bracket.length; i++) {
        NSString *bra = [bracket substringWithRange:NSMakeRange(i, 1)];
        if ([self.map.allKeys containsObject:bra]) {    // 左括号
            [sta push:bra];
        } else {    // 右括号
            if (sta.isEmpty) {
                return false;
            }
            NSString *left = sta.pop;
            if (![bra isEqualToString:[self.map objectForKey:left]]) {
                return false;
            }
        }
    }
    
    // 是否为空
    return sta.isEmpty;
}

- (NSDictionary *)map {
    if (_map == nil) {
        _map = @{@"(":@")",
                 @"{":@"}",
                 @"[":@"]"
                 };
    }
    return _map;
}

@end
