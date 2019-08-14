//
//  BigLetterView.m
//  RandomApp
//
//  Created by yang on 2019/7/15.
//  Copyright © 2019 yang. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (id)initWithFrame:(NSRect)frameRect
{
    if (![super initWithFrame:frameRect])
        return nil;
    NSLog(@"initialzing view");
    bgColor = [[NSColor yellowColor] retain];
    string = @" ";
    return self;
}

- (void) dealloc
{
    [bgColor release];
    [string release];
    [super dealloc];
}

#pragma mark Accessors

- (void)setBgColor:(NSColor *)c
{
    [c retain];
    [bgColor release];
    bgColor = c;
    [self setNeedsDisplay:YES];
}

- (NSColor *)bgColor
{
    return bgColor;
}

- (void)setString: (NSString *)c
{
    c=[c copy];
    [string release];
    string = c;
    NSLog(@"The string is now %@", string);
}

- (NSString *)string
{
    return string;
}

- (void)drawRect:(NSRect)dirtyRect {
    //[super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bounds];
    
    if([[self window] firstResponder] == self) {
        [[NSColor keyboardFocusIndicatorColor] set];
        [NSBezierPath setDefaultLineWidth:4.0];
        [NSBezierPath strokeRect:bounds];
    }
}

- (BOOL) isOpaque
{
    return YES;
}

- (BOOL) acceptsFirstResponder
{
    NSLog(@"Accepting");
    return YES;
}

- (BOOL) resignFirstResponder
{
    NSLog(@"Resigning");
    [self setNeedsDisplay:YES];
    return YES;
}

- (BOOL) becomeFirstResponder
{
    NSLog(@"Becoming");
    [self setNeedsDisplay:YES];
    return YES;
}

- (void)keyDown:(NSEvent *)event
{
    [self interpretKeyEvents:[NSArray arrayWithObjects:event, nil]];
}

- (void)insertText:(id)insertString
{
    [self setString:insertString];
}

- (void)insertTab:(id)sender
{
    [[self window] selectKeyViewFollowingView:self];
}

- (void)insertBacktab:(id)sender
{
    [[self window] selectKeyViewPrecedingView:self];
}

- (void)deleteBackward:(id)sender
{
    [self setString:@" "];
}

-(void)prepareAttributes
{
    attributes = [[NSMutableDictionary alloc] init];
    
    [attributes setObject:[NSFont fontWithName:@"Helvetica" size:75] forKey:NSFontAttributeName];
    
    [attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
}

@end
