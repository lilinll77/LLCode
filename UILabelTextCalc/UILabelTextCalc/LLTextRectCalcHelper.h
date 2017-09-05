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

+ (CGSize)calcByNSStringFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

+ (CGSize)calcByCoreTextFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

+ (CGSize)calcByUILabelFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

+ (CGSize)calcByNSAttributeStringFunction:(NSString *)calcedStr withSize:(CGSize)limitSize;

@end
