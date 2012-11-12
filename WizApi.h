//
//  WizApi.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XMLRPCConnection;
@interface WizApi : NSObject{
    XMLRPCConnection* connectionXmlrpc;
}

@property (retain, nonatomic)XMLRPCConnection* connectionXmlrpc;
- (BOOL) callPostSimpleData:(NSString*)string;
- (BOOL) executeXmlRpc:(NSURL*)url method:(NSString*)method args:(id)args;
@end
