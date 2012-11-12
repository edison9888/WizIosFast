//
//  XMLRPCRequest.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XMLRPCEncoder;
@interface XMLRPCRequest : NSObject{
    NSMutableURLRequest *_request;
    XMLRPCEncoder* _encoder;
}
- (id)initWithHost: (NSURL *)host;
- (void)setMethod: (NSString *)method withObjects: (NSArray *)objects;
- (NSURLRequest *)request;
@end
