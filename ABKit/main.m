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
NSArray*  ABArrayFromString         (NSString* stringToSplit);
NSString* ABStringFromArray         (NSArray* arrayToJoinAsAString);
NSArray*  ABAlphabetizedArray       (NSArray* arrayToAlphabetize);
NSString* ABAlphabetizedString      (NSString* stringToAlphabetize);


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

NSArray* ABArrayFromString(NSString* stringToSplit)
{
    NSMutableArray* characterArray = NSMutableArray.new;
    [stringToSplit enumerateSubstringsInRange:ABRangeForString(stringToSplit) options:(NSStringEnumerationByComposedCharacterSequences) usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [characterArray addObject:substring];
    }];
    return characterArray;
}

NSString* ABStringFromArray(NSArray* arrayToJoinAsAString)
{
    NSMutableString* joinedArray = NSMutableString.new;
    for (NSString* obj in arrayToJoinAsAString)
    {
        [joinedArray appendFormat:@"%@",obj];
    }
    return joinedArray;
}

NSArray* ABAlphabetizedArray(NSArray* arrayToAlphabetize)
{
    return [arrayToAlphabetize sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        BOOL isPunct1 = [[NSCharacterSet punctuationCharacterSet] characterIsMember:[(NSString*)obj1 characterAtIndex:0]];
        BOOL isPunct2 = [[NSCharacterSet punctuationCharacterSet] characterIsMember:[(NSString*)obj2 characterAtIndex:0]];
        if (isPunct1 && !isPunct2) {
            return NSOrderedAscending;
        } else if (!isPunct1 && isPunct2) {
            return NSOrderedDescending;
        }
        return [(NSString*)obj1 compare:obj2 options:NSDiacriticInsensitiveSearch|NSCaseInsensitiveSearch];
    }];
}

NSString* ABAlphabetizedString(NSString* stringToAlphabetize)
{
    return ABStringFromArray(ABAlphabetizedArray(ABArrayFromString(stringToAlphabetize)));
}




int main(int argc, char *argv[])
{
    ABLog(@"%@",ABRangeStringForString(@"Four"),nil);
    
    NSRange rangeToPointTo;
    ABRangePointerForString(&rangeToPointTo,@"Fore");
    ABLog(@"%@",NSStringFromRange(rangeToPointTo),nil);
    
    ABLog(@"%@",ABAlphabetizedArray(@[@"e",@"a",@"c"]),nil);
    
    ABLog(@"%@",ABAlphabetizedString(@"eca"),nil);
    
    return NSApplicationMain(argc, (const char **)argv);
}