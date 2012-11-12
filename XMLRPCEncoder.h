//
//  XMLRPCEncoder.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLRPCEncoder : NSObject {
	NSString *_method, *_source;
	NSArray *_objects;
}

+ (NSString *)encodeString: (NSString *)string;

#pragma mark -

- (void)setMethod: (NSString *)method withObjects: (NSArray *)objects;

#pragma mark -

//- (NSString *)method;
//- (NSArray *)objects;

#pragma mark -

//- (NSString *)source;

@end
