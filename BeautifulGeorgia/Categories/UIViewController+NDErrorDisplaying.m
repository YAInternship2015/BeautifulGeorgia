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

#warning ActionSheet предназначен для других целей. Для отображения ошибок из нативных средств используют этот же UIAlertController, но стиля UIAlertControllerStyleAlert (до ios 8 это был UIAlertView)
- (void)showAlert:(NSString *)title
             text:(NSString *)text
       sourceView:(UIView *)sourceView {
#warning правильнее писать UIAlertController *alert
    UIAlertController * alert =  [UIAlertController
                                  alertControllerWithTitle:title
                                  message:text
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
#warning смотрите замечание выше
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
