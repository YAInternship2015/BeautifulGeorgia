//
//  NDAddItemViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/26/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAddItemViewController.h"
#import "UIViewController+NDAlertDisplaying.h"
#import "NDDataValidator.h"
#import "NDNamedImageFactory.h"
#import "NDNotification.h"
#import "NDDataStorage.h"

@interface NDAddItemViewController ()

@property (nonatomic, weak) IBOutlet UITextField *titleTextField;

@end

@implementation NDAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.titleTextField becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setFocus:)
                                                 name:NDErrorDisplayingDidPressActionNotification
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setFocus:(NSNotification *)notification {
    [self.titleTextField becomeFirstResponder];
}

#pragma mark - Actions

- (IBAction)save:(UIButton *)sender {
    [self saveNewItem];
}

- (IBAction)cancel:(UIButton *)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveNewItem {
    [self.view endEditing:YES];
    NSError *error = nil;
    NSString *title = self.titleTextField.text;
    [NDDataValidator isValidModelTitle:title error:&error];
    
    if (error) {
        NSString *errorText = [NSString stringWithFormat:@"%@ %@",
                               [error localizedFailureReason],
                               [error localizedRecoverySuggestion]];
        [self showErrorAlertWithText:errorText onAccept:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:NDErrorDisplayingDidPressActionNotification object:nil];
        }];
    } else {
        NSError *error = nil;
        NDDataStorage *dataStorage = [[NDDataStorage alloc] init];
        [dataStorage saveNewObject:[NDNamedImageFactory namedImageObjectWithName:title image:nil inManagedObjectContext:AppDelegate.managedObjectContext] error:error];
        if (error) {
            NSString *errorText = [error localizedDescription];
            [self showErrorAlertWithText:errorText onAccept:^{
                [[NSNotificationCenter defaultCenter] postNotificationName:NDErrorDisplayingDidPressActionNotification object:nil];
            }];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self saveNewItem];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [NDDataValidator isValidModelTitle:textField.text.length range:range replacementString:string];
}

@end
