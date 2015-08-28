//
//  NDDataValidator.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDDataValidator.h"

@implementation NDDataValidator

+ (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {

    BOOL isValid = NO;
    
    if (title.length < 3) {
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The length of name is not valid.", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Please, enter name more than 3 symbols.", nil)
                                   };
        *error = [NSError errorWithDomain:@"nd" code:0 userInfo:userInfo];
    } else {
        isValid = YES;
    }
    return isValid;
}

@end
