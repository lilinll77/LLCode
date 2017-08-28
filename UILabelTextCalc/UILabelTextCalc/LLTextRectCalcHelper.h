//
//  LLTextRectCalcHelper.h
//  UILabelTextCalc
//
//  Created by lilinli on 2017/8/28.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIkit/UIkit.h"

@interface LLTextRectCalcHelper : NSObject

+ (CGRect)calcByNSStringFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

+ (CGRect)calcByCoreTextFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

+ (CGRect)calcByUILabelFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

+ (CGRect)calcByNSAttributeStringFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

@end
