//
//  WizFileManager.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "WizFileManager.h"

@implementation WizFileManager

static WizFileManager* shareManager = nil;
+ (id)shareManager
{
    @synchronized(shareManager)
    {
        if (nil == shareManager) {
            shareManager = [[super allocWithZone:NULL]init];
        }
        return shareManager;
    }
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self shareManager]retain];
}
- (id)retain
{
    return self;
}



+ (NSString*)documentsPath
{
    static NSString* documentDirectory = nil;
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentDirectory = [paths objectAtIndex:0];
    
    return documentDirectory;
}

- (BOOL)ensureFileExists:(NSString*)path
{
    if (![self fileExistsAtPath:path]) {
        return [self createFileAtPath:path contents:nil attributes:nil];
    }
    return YES;
}
@end