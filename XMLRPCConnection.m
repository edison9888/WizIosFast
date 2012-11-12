//
//  XMLRPCConnection.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "XMLRPCConnection.h"
#import "XMLRPCRequest.h"

@implementation XMLRPCConnection
@synthesize connection;
@synthesize delegate;
@synthesize request;
@synthesize retData;

- (id)initWithXMLRPCRequest: (XMLRPCRequest *)req delegate: (id) callback;
{
	if (self = [super init])
	{
        
		self.connection = [NSURLConnection connectionWithRequest:[req request] delegate: self];
		self.delegate = callback;
		self.request = req;
		//
		if (self.connection == nil)
		{
			if ([self.delegate respondsToSelector: @selector(xmlrpcDone:isSucceeded:retObject:forMethod:)])
			{
				NSDictionary *usrInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"Connection error. Failed to init NSURLConnection", NSLocalizedDescriptionKey, nil];
				NSError* err = [[NSError errorWithDomain:@"come.effigent.iphone.parseerror" code:-1 userInfo:usrInfo] retain];
				
				[self.delegate xmlrpcDone: self isSucceeded: NO retObject:err forMethod: [req method]];
                [err release];
			}
			//
			return nil;
		}
		//
		self.retData = [[[NSMutableData alloc] init] autorelease];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	}
	
	return self;
}

+ (XMLRPCConnection*)sendAsynchronousXMLRPCRequest: (XMLRPCRequest *)request delegate: (id) delegate;
{
    return [[[XMLRPCConnection alloc] initWithXMLRPCRequest:request delegate:delegate] autorelease];
}
@end
