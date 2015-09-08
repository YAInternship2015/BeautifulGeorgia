//
//  NDDataValidator.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDDataValidator.h"

static const NSInteger kTitleMaxLength = 20;
static const NSInteger kTitleMinLength = 3;

@implementation NDDataValidator

+ (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {

    BOOL isValid = NO;
    
    if (title.length < kTitleMinLength) {
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
    return newLength <= kTitleMaxLength;
}

@end
