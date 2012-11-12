//
//  XMLRPCRequest.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "XMLRPCRequest.h"
#import "XMLRPCEncoder.h"
#import "WizFileManager.h"

@implementation XMLRPCRequest
- (id)initWithHost: (NSURL *)host
{
	if (self = [super init])
	{
		if (host != nil)
		{
			_request = [[NSMutableURLRequest alloc] initWithURL: host];
		}
		else
		{
			_request = [[NSMutableURLRequest alloc] init];
		}
		
		_encoder = [[XMLRPCEncoder alloc] init];
		
		[_request setTimeoutInterval:120.0f];
		// TODO: this should not be kept in the generic classes.
		NSString *version  = [[[NSBundle mainBundle] infoDictionary] valueForKey:[NSString stringWithFormat:@"CFBundleVersion"]];
		[self setUserAgent:[NSString stringWithFormat:@"wp-iphone/%@",version]];
	}
	
	return self;
}

- (void)setUserAgent: (NSString *)agent
{
	if ([self userAgent] == nil)
	{
		[_request addValue: agent forHTTPHeaderField: @"User-Agent"];
	}
	else
	{
		[_request setValue: agent forHTTPHeaderField: @"User-Agent"];
	}
}
- (NSString *)userAgent
{
	return [_request valueForHTTPHeaderField: @"User-Agent"];
}

- (void)setMethod: (NSString *)method withObjects: (NSArray *)objects
{
	[_encoder setMethod: method withObjects: objects];
}

- (NSURLRequest *)request
{
	NSData *request = [[_encoder encode] dataUsingEncoding: NSUTF8StringEncoding];
	NSNumber *length = [NSNumber numberWithInt: [request length]];
	
	NSString* filename = [[WizFileManager documentsPath] stringByAppendingPathComponent:@"xml-rpc-request.xml"];
	[request writeToFile:filename atomically:NO];
    //wiz-dzpqzb
	//
	if (request == nil)
	{
		return nil;
	}
	
	[_request setHTTPMethod: @"POST"];
	
	if ([_request valueForHTTPHeaderField: @"Content-Length"] == nil)
	{
		[_request addValue: @"text/xml" forHTTPHeaderField: @"Content-Type"];
	}
	else
	{
		[_request setValue: @"text/xml" forHTTPHeaderField: @"Content-Type"];
	}
	
	if ([_request valueForHTTPHeaderField: @"Content-Length"] == nil)
	{
		[_request addValue: [length stringValue] forHTTPHeaderField: @"Content-Length"];
	}
	else
	{
		[_request setValue: [length stringValue] forHTTPHeaderField: @"Content-Length"];
	}
	
	[_request setHTTPBody: request];
	
	return (NSURLRequest *)_request;
}

- (void)dealloc
{
	[_request release];
	[_encoder release];
	
	[super dealloc];
}
@end
