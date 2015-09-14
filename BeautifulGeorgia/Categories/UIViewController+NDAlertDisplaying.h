//
//  UIViewController+NDAlertDisplaying.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NDAlertDisplaying)

- (void) showActionAlertWithTitle:(NSString *)title
                             text:(NSString *)text
                           accept:(NSString *)acceptStr
                           reject:(NSString *)rejectStr
                         onAccept:(void(^)())accept
                         onReject:(void(^)())reject;

- (void)showErrorAlertWithText:(NSString *)text onAccept:(void(^)())accept;

@end
