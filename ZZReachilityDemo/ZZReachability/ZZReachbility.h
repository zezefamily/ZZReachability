//
//  ZZReachbility.h
//  NetStatue
//
//  Created by zezefamily on 15/6/3.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//


/*
                *****使用说明******
 
 ZZReachbility *reach = [[ZZReachbility alloc]init];
 
 [reach startToReachbility];
 
 reach.getNetStatus = ^(NetworkStatus status){
 
    NSLog(@"status == %ld",status);
 
 };
 
*/

#import <Foundation/Foundation.h>
#import "Reachability.h"

typedef void (^NetStatueBlock)(NetworkStatus status);


@interface ZZReachbility : NSObject

@property (nonatomic,strong) NetStatueBlock getNetStatus;


/**
   启动网络监听器
   @warning 需要真机测试有效
*/
- (void)startToReachbility;

/**
 添加网络监听
 */
- (void)addNetWorkNotification;

/**
 删除网络监听
 */
- (void)removeNetWorkNotification;

/**
   获取当前网络状态 返回值为NetworkStatus
 */
- (NetworkStatus)getNetWorkStatus;




@end
