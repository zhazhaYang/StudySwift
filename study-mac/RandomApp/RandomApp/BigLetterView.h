//
//  BigLetterView.h
//  RandomApp
//
//  Created by yang on 2019/7/15.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigLetterView : NSView
{
    NSColor *bgColor;
    NSString *string;
    NSMutableDictionary *attributes;
}
@property (retain, readwrite) NSColor *bgColor;
@property (copy, readwrite) NSString *string;
@end

NS_ASSUME_NONNULL_END
