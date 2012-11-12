//
//  WizApi.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "WizApi.h"
#import "XMLRPCRequest.h"
#import "XMLRPCConnection.h"

@implementation WizApi
@synthesize connectionXmlrpc;
- (BOOL) callPostSimpleData:(NSString*)path
{
    if (!path) {
        return NO;
    }
    NSURL *url = [NSURL URLWithString:path];
    return [self executeXmlRpc:url method:@"document.postSimpleData" args:nil];
}
- (BOOL) executeXmlRpc:(NSURL*)url method:(NSString*)method args:(id)args
{
    XMLRPCRequest* request = [[XMLRPCRequest alloc]initWithHost:url];
    if (!request) {
        return NO;
    }
    [request setMethod:method withObjects:args];
    self.connectionXmlrpc = [XMLRPCConnection sendAsynchronousXMLRPCRequest:request delegate:self];
    [request release];
    if (nil != self.connectionXmlrpc)
        return YES;
    else
        return NO;
}
@end
