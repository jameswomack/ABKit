//
//  NSString+ABKit.h
//  ABKit
//
//  Created by James Womack on 2/3/13.
//  Copyright (c) 2013 James Womack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ABKit)

+ (NSString*)stringWithFormat:(NSString*)format arguments:(va_list)valuesToPassToFormat;

@end
