//
//  UIViewController+NDErrorDisplaying.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "UIViewController+NDErrorDisplaying.h"
#import "NDNotification.h"

@implementation UIViewController (NDErrorDisplaying)

- (void)showAlert:(NSString *)title
             text:(NSString *)text {

    UIAlertController *alert =  [UIAlertController
                                  alertControllerWithTitle:title
                                  message:text
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"OkeyKey", nil) style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   [[NSNotificationCenter defaultCenter] postNotificationName:NDErrorDisplayingDidPressActionNotification object:action];
                                               }];
    [alert addAction:ok];
    alert.view.tintColor = [UIColor redColor];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
