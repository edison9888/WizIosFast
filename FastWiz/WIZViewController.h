//
//  WIZViewController.h
//  FastWiz
//
//  Created by wiz on 12-11-12.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WizFileManager;

@interface WIZViewController : UIViewController{
}
@property (retain, nonatomic) IBOutlet UITextView *myText;
//@property (retain, nonatomic) WizFileManager* fileManager;
- (IBAction)Save;

@end
