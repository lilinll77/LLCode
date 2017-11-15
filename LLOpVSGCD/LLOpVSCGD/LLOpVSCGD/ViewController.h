//
//  ViewController.h
//  LLOpVSCGD
//
//  Created by lilinli on 2017/11/15.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

typedef void(^Task)(void);

+ (Task)getATask;

@end

