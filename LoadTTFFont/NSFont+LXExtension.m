//
//  NSFont+LXExtension.m
//  BCExtension
//
//  Created by xu lian on 12-03-26.
//  Copyright (c) 2012 Beyondcow. All rights reserved.
//

#import "NSFont+LXExtension.h"

@implementation NSFont (LXExtension)

+ (NSFont*)customFontWithName:(NSString *)fontName
                       ofType:(NSString *)type
                   attributes:(NSDictionary *)attributes
{
    NSString *fontPath = [[NSBundle mainBundle] pathForResource:fontName ofType:type];
    NSData *data = [[NSData alloc] initWithContentsOfFile:fontPath];
    CGDataProviderRef fontProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
#if  !__has_feature(objc_arc)
    [data release];
#endif
    CGFontRef cgFont = CGFontCreateWithDataProvider(fontProvider);
    CGDataProviderRelease(fontProvider);
    CTFontDescriptorRef fontDescriptor = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attributes);
    CTFontRef font = CTFontCreateWithGraphicsFont(cgFont, 0, NULL, fontDescriptor);
    CFRelease(fontDescriptor);
    CGFontRelease(cgFont);
    return (__bridge NSFont*)font;
}

+ (NSFont*)customTTFFontWithName:(NSString *)fontName fontSize:(float)fontsize
{
    NSDictionary *fontsizeAttr=[NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithFloat:fontsize], NSFontSizeAttribute,
                                nil];
    return [NSFont customFontWithName:fontName 
                               ofType:@"ttf" 
                           attributes:fontsizeAttr];
}
@end
