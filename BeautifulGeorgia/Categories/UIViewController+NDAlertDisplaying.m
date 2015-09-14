//
//  UIViewController+NDAlertDisplaying.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "UIViewController+NDAlertDisplaying.h"
#import "UIColor+NDCustomColors.h"

@implementation UIViewController (NDAlertDisplaying)

- (void) showActionAlertWithTitle:(NSString *)title
                             text:(NSString *)text
                           accept:(NSString *)acceptStr
                           reject:(NSString *)rejectStr
                         onAccept:(void(^)())accept
                         onReject:(void(^)())reject {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:text
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *acceptAct = [UIAlertAction actionWithTitle:acceptStr
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          if (accept) {
                                                              accept();
                                                          }
                                                      }];
    [controller addAction:acceptAct];
    
    UIAlertAction *rejectAct = [UIAlertAction actionWithTitle:rejectStr
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action) {
                                                          if (reject) {
                                                              reject();
                                                          }
                                                      }];
    [controller addAction:rejectAct];
    
    controller.view.tintColor = [UIColor darkBlueColor];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)showErrorAlertWithText:(NSString *)text onAccept:(void(^)())accept {
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:(NSLocalizedString(@"ErrorTitleKey", nil)) message:text preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *acceptAct = [UIAlertAction actionWithTitle:(NSLocalizedString(@"OkeyKey", nil))
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action) {
                                                          if (accept) {
                                                              accept();
                                                          }
                                                      }];
    [controller addAction:acceptAct];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
