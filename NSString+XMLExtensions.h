//
//  NSString+XMLExtensions.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(XMLExtensions)

+ (NSString*)encodeXMLCharactersIn:(NSString*)source;
+ (NSString*)decodeXMLCharactersIn:(NSString*)source;

@end
