//
//  WizFileManager.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WizFileManager : NSFileManager
+ (id)shareManager;

+ (NSString*)documentsPath;
- (BOOL)ensureFileExists:(NSString*)path;
@end
