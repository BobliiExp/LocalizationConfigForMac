//
//  ViewController.m
//  LocalizationCheck
//
//  Created by Bob Lee on 2019/1/24.
//  Copyright © 2019年 Bob Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@property (nonatomic, weak) IBOutlet NSPopUpButton *drop0;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop1;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop2;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop3;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop4;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop5;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop6;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop7;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop8;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop9;
@property (nonatomic, weak) IBOutlet NSPopUpButton *drop10;

@property (nonatomic, weak) IBOutlet NSTextField *lab0;
@property (nonatomic, weak) IBOutlet NSTextField *lab1;
@property (nonatomic, weak) IBOutlet NSTextField *lab2;
@property (nonatomic, weak) IBOutlet NSTextField *lab3;
@property (nonatomic, weak) IBOutlet NSTextField *lab4;
@property (nonatomic, weak) IBOutlet NSTextField *lab5;
@property (nonatomic, weak) IBOutlet NSTextField *lab6;
@property (nonatomic, weak) IBOutlet NSTextField *lab7;
@property (nonatomic, weak) IBOutlet NSTextField *lab8;
@property (nonatomic, weak) IBOutlet NSTextField *lab9;
@property (nonatomic, weak) IBOutlet NSTextField *lab10;

@property (nonatomic, weak) IBOutlet NSTextField *field0;
@property (nonatomic, weak) IBOutlet NSTextField *field1;
@property (nonatomic, weak) IBOutlet NSTextField *field2;
@property (nonatomic, weak) IBOutlet NSTextField *field3;
@property (nonatomic, weak) IBOutlet NSTextField *field4;
@property (nonatomic, weak) IBOutlet NSTextField *field5;
@property (nonatomic, weak) IBOutlet NSTextField *field6;
@property (nonatomic, weak) IBOutlet NSTextField *field7;
@property (nonatomic, weak) IBOutlet NSTextField *field8;
@property (nonatomic, weak) IBOutlet NSTextField *field9;
@property (nonatomic, weak) IBOutlet NSTextField *field10;

@property (nonatomic, weak) IBOutlet NSButton *btnGeneral;  

@property (nonatomic, strong) NSArray *arrLaguage;   ///< 语言

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.window.restorable = NO;
    self.view.window.minSize = NSSizeFromCGSize(self.view.frame.size);
    self.view.window.contentMinSize = self.view.window.contentMaxSize = self.view.frame.size;
    
    
    [self setupUI];
    [self setupData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidResize:)
                                                 name:NSWindowDidResizeNotification
                                               object:self];
    

}

- (void)windowDidResize:(NSNotification *)aNotification
{
    
}

- (void)resizeSubviewsWithOldSize:(NSSize)oldBoundsSize
{
    // 根据需要调整NSView上面的别的控件和视图的frame
    self.view.window.contentMinSize = NSMakeSize(744, 425);
}

- (void)setupUI {
    NSInteger tag = 1000;
    _lab0.tag = tag; tag++;
    _lab1.tag = tag; tag++;
    _lab2.tag = tag; tag++;
    _lab3.tag = tag; tag++;
    _lab4.tag = tag; tag++;
    _lab5.tag = tag; tag++;
    _lab6.tag = tag; tag++;
    _lab7.tag = tag; tag++;
    _lab8.tag = tag; tag++;
    _lab9.tag = tag; tag++;
    _lab10.tag = tag;
    
    tag = 10000;
    _field0.tag = tag; tag++;
    _field1.tag = tag; tag++;
    _field2.tag = tag; tag++;
    _field3.tag = tag; tag++;
    _field4.tag = tag; tag++;
    _field5.tag = tag; tag++;
    _field6.tag = tag; tag++;
    _field7.tag = tag; tag++;
    _field8.tag = tag; tag++;
    _field9.tag = tag; tag++;
    _field10.tag = tag;
    
    tag = 100000;
    _drop0.tag = tag; tag++; _drop0.hidden = YES;
    _drop1.tag = tag; tag++;
    _drop2.tag = tag; tag++;
    _drop3.tag = tag; tag++;
    _drop4.tag = tag; tag++;
    _drop5.tag = tag; tag++;
    _drop6.tag = tag; tag++;
    _drop7.tag = tag; tag++;
    _drop8.tag = tag; tag++;
    _drop9.tag = tag; tag++;
    _drop10.tag = tag;
}

- (void)setupData {
    _arrLaguage = @[@"en",
                    @"es-MX",
                    @"hi",
                    @"ja",
                    @"ko",
                    @"pt-BR",
                    @"ru",
                    @"th",
                    @"vi",
                    @"zh-Hans",
                    @"zh-Hant",];
    
    for(NSInteger i=0; i<_arrLaguage.count; i++){
        NSTextField *field = [self.view viewWithTag:1000+i];
        field.stringValue = [NSString stringWithFormat:@"%@:%@", [self getZhDesc:_arrLaguage[i]], _arrLaguage[i]];
        
        if(i==0)
            continue;
        
        NSPopUpButton *pop = [self.view viewWithTag:100000+i];
        [pop removeAllItems];
        
        NSMutableArray *items = [_arrLaguage mutableCopy];
        [items removeObjectAtIndex:i];
        [pop addItemsWithTitles:items];
    }
}

- (NSString*)getZhDesc:(NSString*)key {
    if([key isEqualToString:@"en"]){
        return @"英文";
    }else if([key isEqualToString:@"es-MX"]){
        return @"西班牙语（墨西哥）";
    }else if([key isEqualToString:@"hi"]){
        return @"北印度语";
    }else if([key isEqualToString:@"ja"]){
        return @"日语";
    }else if([key isEqualToString:@"ko"]){
        return @"韩语";
    }else if([key isEqualToString:@"pt-BR"]){
        return @"葡萄牙语（巴西）";
    }else if([key isEqualToString:@"ru"]){
        return @"俄罗斯";
    }else if([key isEqualToString:@"th"]){
        return @"泰语";
    }else if([key isEqualToString:@"vi"]){
        return @"越南语";
    }else if([key isEqualToString:@"zh-Hans"]){
        return @"中文";
    }else if([key isEqualToString:@"zh-Hant"]){
        return @"繁体";
    }
    
    return @"未知";
}

- (IBAction)btnAction:(id)sender {
    NSString *spanLan = @"*_*";
    NSString *spanContent = @"*|*";
    NSString *spanDesc = @"*:*";
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    
    for(NSInteger i=0; i<_arrLaguage.count; i++){
        NSString *key = _arrLaguage[i];
        
        NSTextField *field = [self.view viewWithTag:10000+i];
        if(field.stringValue.length>0){
            [mDic setObject:@{@"desc":field.stringValue, @"rekey":[NSMutableArray array]} forKey:key];
        }
    }
    
    if([mDic objectForKey:@"en"]==nil ||
       [mDic objectForKey:@"zh-Hans"]==nil) {
        NSAlert *alert = [NSAlert new];
        [alert addButtonWithTitle:@"关闭"];
        [alert setMessageText:@"英文与简体中文必须填写描述"];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSModalResponse returnCode) {
        }];
        return;
    }
    
    if(mDic.count==0){
        NSAlert *alert = [NSAlert new];
        [alert addButtonWithTitle:@"关闭"];
        [alert setMessageText:@"请至少输入一种语言描述"];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSModalResponse returnCode) {
        }];
        return;
    }
    
    // 没有配置的都用英语
    NSDictionary *dicEn = [mDic objectForKey:@"en"];
    NSMutableString *warn = [NSMutableString string];
    
    for(NSInteger i=0; i<_arrLaguage.count; i++){
        NSString *key = _arrLaguage[i];
        
        NSTextField *field = [self.view viewWithTag:10000+i];
        if(field.stringValue.length>0){
            continue;
        }
        
        NSPopUpButton *drop = [self.view viewWithTag:100000+i];
        NSString *keyR = drop.selectedItem.title;
        NSDictionary *dic = [mDic objectForKey:keyR];
        if(dic == nil) {
            [warn appendString:key];
            [warn appendString:@","];
        }
        
        dic = dic ? : dicEn;
        
        if(dic){
            NSMutableArray *arr = [dic objectForKey:@"rekey"];
            [arr addObject:key];
        }
    }
    
    // 解析dic
    NSMutableString *result = [NSMutableString string];
    
    for(NSString *key in mDic.allKeys){
        if(key != mDic.allKeys.firstObject){
            [result appendString:spanLan];
        }
        
        [result appendString:key];
        
        NSDictionary *dic = [mDic objectForKey:key];
        NSMutableArray *arr = [dic objectForKey:@"rekey"];
        if(arr.count>0){
            for(NSString *keyR in arr){
                [result appendString:spanContent];
                [result appendString:keyR];
            }
        }
        
        [result appendString:spanDesc];
        [result appendString:dic[@"desc"]];
    }
    
    NSAlert *alert = [NSAlert new];
    [alert addButtonWithTitle:@"拷贝"];
    [alert addButtonWithTitle:@"关闭"];
    
    if(warn.length>0){
        [alert setMessageText:[NSString stringWithFormat:@"注意：以下配置没有输入文本且替换语言也没有配置，将默认使用英文\n%@", warn]];
    }else {
        [alert setMessageText:@"请检查输入配置，然后拷贝使用"];
    }
    [alert setInformativeText:result];
    [alert setAlertStyle:NSInformationalAlertStyle];
    [alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSModalResponse returnCode) {
        if(returnCode == NSAlertFirstButtonReturn){
            NSPasteboard *paste = [NSPasteboard generalPasteboard];
            [paste clearContents];
            [paste writeObjects:@[result]];
            
        }else if(returnCode == NSAlertSecondButtonReturn){
            
        }
    }];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
