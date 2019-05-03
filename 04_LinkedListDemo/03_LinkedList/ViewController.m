//
//  ViewController.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "LinkList/LinkedList.h"

@interface ViewController ()
/** list*/
@property(nonatomic,strong)LinkedList *list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LinkedList *list = [[LinkedList alloc] init];
    self.list = list;
    [list add:@1];
    [list add:@2];
    [list add:@3];
    [list add:@4];
    [list add:@5];
    NSLog(@"%@",list.description);
    
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
    LinkNode *lastNode = list.last;
    lastNode.next = list.first.next;
//    NSLog(@"%@",list.first.description);  // 不打印,因为一直在循环中
    bool hasCycle = [self hasCycle:list.first];
    NSLog(@"是否有环:%d",hasCycle);
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

@end
