//
//  XMLRPCConnection.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMLRPCRequest;
@interface XMLRPCConnection : NSObject{
	NSURLConnection *connection;
	id delegate;
	XMLRPCRequest* request;
	//
	NSMutableData* retData;
}


@property (nonatomic, retain) NSURLConnection* connection;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) XMLRPCRequest* request;
@property (nonatomic, retain) NSMutableData* retData;


#pragma mark -

+ (XMLRPCConnection*)sendAsynchronousXMLRPCRequest: (XMLRPCRequest *)req delegate: (id) callback;

#pragma mark -

//- (void)cancel;

@end

#pragma mark -

//@interface NSObject (XMLRPCConnectionDelegate)
//
//- (void)xmlrpcDone: (XMLRPCConnection *)connection isSucceeded: (BOOL)succeeded retObject: (id)ret forMethod: (NSString *)method;
//
//@end
