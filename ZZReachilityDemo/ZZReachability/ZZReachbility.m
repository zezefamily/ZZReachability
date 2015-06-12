//
//  ZZReachbility.m
//  NetStatue
//
//  Created by zezefamily on 15/6/3.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ZZReachbility.h"

@interface ZZReachbility ()
{
    NetworkStatus remoteHostStatus;
    Reachability *hostReach;
}
@end

@implementation ZZReachbility

- (void)addNetWorkNotification
{
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
}

- (void)removeNetWorkNotification
{
   [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}
//启动试试监听
- (void)startToReachbility
{
    [self addNetWorkNotification];
    hostReach = [Reachability reachabilityWithHostName: @"www.baidu.com"];
    [hostReach startNotifier];
}


- (NetworkStatus)getNetWorkStatus
{
    hostReach = [Reachability reachabilityWithHostName: @"www.baidu.com"];
    return [hostReach currentReachabilityStatus];
}

- (void)reachabilityChanged:(NSNotification *)notification
{
    Reachability* curReach = [notification object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus;
    netStatus = [curReach currentReachabilityStatus];
    
    self.getNetStatus(netStatus);
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}


@end
