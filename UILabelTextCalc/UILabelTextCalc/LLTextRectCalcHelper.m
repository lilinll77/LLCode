//
//  LLTextRectCalcHelper.m
//  UILabelTextCalc
//
//  Created by lilinli on 2017/8/28.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "LLTextRectCalcHelper.h"
#import <CoreText/CoreText.h>

@implementation LLTextRectCalcHelper

+ (CGSize)calcByNSStringFunction:(NSString *)calcedStr withSize:(CGSize)limitSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 2;

    
    NSDictionary* attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 NSParagraphStyleAttributeName: paragraphStyle,
                                 NSForegroundColorAttributeName: [UIColor blackColor]};
    
    CGRect rect = [calcedStr boundingRectWithSize:limitSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
   
    return rect.size;
}

+ (CGSize)calcByCoreTextFunction:(NSString *)calcedString withSize:(CGSize)limitSize
{
    if (nil == calcedString) {
        return CGSizeZero;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 2;
    
    NSMutableAttributedString *attibuteStr = [[NSMutableAttributedString alloc] initWithString:calcedString];
    
    [attibuteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, calcedString.length)];

    [attibuteStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, calcedString.length)];
    
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)attibuteStr;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedStringRef);
    CFRange range = CFRangeMake(0, calcedString.length);
    
    // This logic adapted from @mattt's TTTAttributedLabel
    // https://github.com/mattt/TTTAttributedLabel
    
//    if (framesetter) {
//        CGMutablePathRef path = CGPathCreateMutable();
//        CGPathAddRect(path, NULL, CGRectMake(0, 0, limitSize.width, limitSize.height));
//        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
//        CFArrayRef lines = CTFrameGetLines(frame);
//        
////        if (nil != lines && CFArrayGetCount(lines) > 0)
////        {
////            NSInteger lastVisibleLineIndex = MIN(1, CFArrayGetCount(lines)) - 1;
////            CTLineRef lastVisibleLine = CFArrayGetValueAtIndex(lines, lastVisibleLineIndex);
////            
////            CFRange rangeToLayout = CTLineGetStringRange(lastVisibleLine);
////            range = CFRangeMake(0, rangeToLayout.location + rangeToLayout.length);
////        }
//        
//        CFRelease(frame);
//        CFRelease(path);
//    }
    
    CFRange fitCFRange = CFRangeMake(0, 0);
    CGSize newSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, range, NULL, limitSize, &fitCFRange);
    
    if (nil != framesetter) {
        CFRelease(framesetter);
        framesetter = nil;
    }
    
    return CGSizeMake(ceilf(newSize.width), ceilf(newSize.height));
}

+ (CGSize)calcByUILabelFunction:(NSString *)calcedStr withSize:(CGSize)limitSize
{
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        paragraphStyle.lineSpacing = 2;
        
        NSMutableAttributedString *attibuteStr = [[NSMutableAttributedString alloc] initWithString:calcedStr];
        
        [attibuteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, calcedStr.length)];
        
        [attibuteStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, calcedStr.length)];
        
        UILabel *label = [UILabel new];
        [label setAttributedText:attibuteStr];
        label.numberOfLines = 0;
        label.textColor = [UIColor blackColor];
        
        CGSize resultSize = [label sizeThatFits:limitSize];
        
//    });
  
    
    return resultSize;
//    return CGSizeZero;
}

+ (CGSize)calcByNSAttributeStringFunction:(NSString *)calcedStr withSize:(CGSize)limitSize
{
    return CGSizeZero;
}

@end
