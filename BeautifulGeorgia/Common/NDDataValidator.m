//
//  NDDataValidator.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDDataValidator.h"

#warning вместо define лучше использовать константы, например
// static const NSInteger kTitleMaxLength = 20;
#define MAX_LENGTH 20
#define MIN_LENGTH 3

@implementation NDDataValidator

+ (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {

    BOOL isValid = NO;
    
    if (title.length < MIN_LENGTH) {
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"DescriptionKey", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"ReasonErrorKey", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"SuggestionErrorKey", nil)
                                   };
        *error = [NSError errorWithDomain:@"com.beautifulGeorgia" code:0 userInfo:userInfo];
    } else {
        isValid = YES;
    }
    return isValid;
}

+ (BOOL)isValidModelTitle:(NSUInteger)length
                    range:(NSRange)range
        replacementString:(NSString *)string {
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    NSUInteger newLength = length - rangeLength + replacementLength;
    return newLength <= MAX_LENGTH;
}

@end
