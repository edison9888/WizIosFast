//
//  NSString+XMLExtensions.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "NSString+XMLExtensions.h"

@implementation NSString(XMLExtensions)

+ (NSString*)encodeXMLCharactersIn:(NSString*)source
{
    if (!source || ![source isKindOfClass:[NSString class]]) {
        return @"";
    }
    NSString *result = [NSString stringWithString:source];
    
    if ([result rangeOfString:@"&"].location != NSNotFound) {
        result = [[result componentsSeparatedByString:@"&"] componentsJoinedByString:@"&amp"];
    }
    if ([result rangeOfString:@"<"].location != NSNotFound) {
        result = [[result componentsSeparatedByString:@"<"] componentsJoinedByString:@"&lt"];
    }
    if ([result rangeOfString:@">"].location != NSNotFound) {
        result = [[result componentsSeparatedByString:@">"] componentsJoinedByString:@"&gt"];
    }
    if ([result rangeOfString:@"\""].location != NSNotFound) {
        result = [[result componentsSeparatedByString:@"\""] componentsJoinedByString:@""];
    }
    if ([result rangeOfString:@"'"].location != NSNotFound) {
        result = [[result componentsSeparatedByString:@"'"] componentsJoinedByString:@"&amp"];
    }
}
+ (NSString*)decodeXMLCharactersIn:(NSString*)source
{
    
}

@end
