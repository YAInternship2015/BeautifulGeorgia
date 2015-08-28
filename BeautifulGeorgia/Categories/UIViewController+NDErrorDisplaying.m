//
//  UIViewController+NDErrorDisplaying.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "UIViewController+NDErrorDisplaying.h"

NSString *const NDErrorDisplayingDidPressActionNotification = @"NDErrorDisplayingDidPressActionNotification";

@implementation UIViewController (NDErrorDisplaying)

- (void)showAlert:(NSString *)title
             text:(NSString *)text
       sourceView:(UIView *)sourceView {
    UIAlertController * alert =  [UIAlertController
                                  alertControllerWithTitle:title
                                  message:text
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   [[NSNotificationCenter defaultCenter] postNotificationName:NDErrorDisplayingDidPressActionNotification object:action];
                                               }];
    [alert addAction:ok];
    alert.view.tintColor = [UIColor redColor];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UIPopoverPresentationController *popPresenter = [alert
                                                         popoverPresentationController];
        popPresenter.sourceView = sourceView;
        popPresenter.sourceRect = sourceView.bounds;
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
