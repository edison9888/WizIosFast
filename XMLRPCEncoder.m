//
//  XMLRPCEncoder.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "XMLRPCEncoder.h"

@implementation XMLRPCEncoder
- (NSString *)encodeString: (NSString *)string
{
	return [self valueTag: @"string" value: string];
}


- (void)setMethod: (NSString *)method withObjects: (NSArray *)objects
{
	if (_method != nil)
	{
		[_method autorelease];
	}
	
	if (_objects != nil)
	{
		[_objects autorelease];
	}
	
	if (method == nil)
	{
		_method = nil;
	}
	else
	{
		_method = [method retain];
	}
	
	if (objects == nil)
	{
		_objects = nil;
	}
	else
	{
		_objects = [objects retain];
	}
}
@end
