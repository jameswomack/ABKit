//
//  main.m
//  ABKit
//
//  Created by James Womack on 2/3/13.
//  Copyright (c) 2013 James Womack. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ABKit.h"

NSString* ABString                  (NSString* format, ...);
void      ABLog                     (NSString* format, ...);
NSRange   ABRangeForString          (NSString* stringToExpressRangeFor);
void      ABRangePointerForString   (NSRangePointer rangePointer, NSString* stringToExpressRangeFor);
NSString* ABRangeStringForString    (NSString* stringToExpressRangeFor);


NSString* ABString(NSString* format, ...)
{
    va_list valuesToPassToFormat;
    va_start(valuesToPassToFormat, format);
    NSString* string = [NSString stringWithFormat:format arguments:valuesToPassToFormat];
    va_end(valuesToPassToFormat);
    return string;
}

void ABLog(NSString* format, ...)
{
    va_list valuesToPassToFormat;
    va_start(valuesToPassToFormat, format);
    NSString* logMessage = [NSString stringWithFormat:format arguments:valuesToPassToFormat];
    va_end(valuesToPassToFormat);
    return NSLog(@"%@", logMessage);
}

NSRange ABRangeForString(NSString* stringToExpressRangeFor)
{
    NSUInteger length = stringToExpressRangeFor.length;
    NSRange range = NSMakeRange(0, length);
    return range;
}

void ABRangePointerForString(NSRangePointer rangePointer, NSString* stringToExpressRangeFor)
{
    *rangePointer = ABRangeForString(stringToExpressRangeFor);
}

NSString* ABRangeStringForString(NSString* stringToExpressRangeFor)
{
    return NSStringFromRange(ABRangeForString(stringToExpressRangeFor));
}



int main(int argc, char *argv[])
{
    ABLog(@"%@",ABRangeStringForString(@"Four"),nil);
    
    NSRange rangeToPointTo;
    ABRangePointerForString(&rangeToPointTo,@"Fore");
    ABLog(@"%@",NSStringFromRange(rangeToPointTo),nil);
    
    return NSApplicationMain(argc, (const char **)argv);
}