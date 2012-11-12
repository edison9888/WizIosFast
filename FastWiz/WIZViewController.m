//
//  WIZViewController.m
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "WIZViewController.h"
#import "WizFileManager.h"

@interface WIZViewController ()

@end

@implementation WIZViewController
//@synthesize fileManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_myText release];
    [super dealloc];
}
- (IBAction)Save {
    NSString* myStr = self.myText.text;
    WizFileManager* fileManager = [WizFileManager shareManager];
    NSString* filename = [[WizFileManager documentsPath]stringByAppendingPathComponent:@"index.html"];
    if ([fileManager ensureFileExists:filename]) {
        
    }
}
@end
