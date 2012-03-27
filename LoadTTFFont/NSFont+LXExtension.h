//
//  NSFont+LXExtension.h
//  BCExtension
//
//  Created by xu lian on 12-03-26.
//  Copyright (c) 2012 Beyondcow. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSFont (LXExtension)

+ (NSFont*)customFontWithName:(NSString *)fontName
                       ofType:(NSString *)type
                   attributes:(NSDictionary *)attributes;

+ (NSFont*)customTTFFontWithName:(NSString *)fontName
                        fontSize:(float)fontsize;
@end
