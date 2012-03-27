//
//  AppDelegate.m
//  LoadTTFFont
//
//  Created by xu lian on 12-03-26.
//  Copyright (c) 2012 Beyondcow. All rights reserved.
//

#import "AppDelegate.h"
#import "NSFont+LXExtension.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize textView = _textView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSFont *font=[NSFont customTTFFontWithName:@"myfont" fontSize:17];
    NSLog(@"%@",font); //This line should output following line
    //"FZXHJW--GB1-0 18.00 pt. P [] (0x100308030) fobj=0x100308030, spc=9.00"
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSColor blackColor], NSForegroundColorAttributeName,
                                    font, NSFontAttributeName, nil];
    
    NSString *text=@"许多希望开始做苹果软件开发的程序员都苦于没有合适的实例，虽然很多优秀的开源软件，但代码量大，阅读梯度陡峭。下面例子是我在 CocoaChina 发帖时积累下来的一些典型案例。使用Objective-C语言编写，目标明确，代码简洁，是很好入门例子。";
    NSAttributedString *str=[[NSAttributedString alloc] initWithString:text attributes:textAttributes];
    [_textView.textStorage setAttributedString:str];

}

@end
