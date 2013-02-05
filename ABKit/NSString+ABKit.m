//
//  NSString+ABKit.m
//  ABKit
//
//  Created by James Womack on 2/3/13.
//  Copyright (c) 2013 James Womack. All rights reserved.
//

#import "NSString+ABKit.h"

@implementation NSString (ABKit)

+ (NSString*)stringWithFormat:(NSString*)format arguments:(va_list)valuesToPassToFormat
{
    return [NSString.alloc initWithFormat:format arguments:valuesToPassToFormat];
}

@end
