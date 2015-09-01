//
//  NDContainerViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/23/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDContainerViewController.h"
#import "NDCollectionViewController.h"
#import "NDTableViewController.h"

#define collectionSegue @"collectionSegue"
#define tableSegue @"tableSegue"

@interface NDContainerViewController ()

@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) UIViewController *nextViewController;
@property (nonatomic, assign) BOOL transitionInProgress;

@end

@implementation NDContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitionInProgress = NO;
    [self performSegueWithIdentifier:tableSegue sender:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:tableSegue]) {
        if (self.childViewControllers.count > 0) {
            self.currentViewController = [self.childViewControllers lastObject];
            self.nextViewController = segue.destinationViewController;
            [self swapViewController:self.currentViewController toViewController:self.nextViewController];
        } else {
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    } else if ([segue.identifier isEqualToString:collectionSegue]) {
        self.currentViewController = [self.childViewControllers lastObject];
        self.nextViewController = segue.destinationViewController;
        [self swapViewController:self.currentViewController toViewController:self.nextViewController];
    }
}

- (void)swapViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
#warning вместо CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) можно писать self.view.bounds
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (IBAction)switchView:(UIBarButtonItem *)sender {
    if (self.transitionInProgress) {
        return;
    }
    self.transitionInProgress = YES;
    if ([[self.childViewControllers lastObject] isKindOfClass:[NDTableViewController class]]) {
        [self performSegueWithIdentifier:collectionSegue sender:self];
    } else if ([[self.childViewControllers lastObject] isKindOfClass:[NDCollectionViewController class]]) {
        [self performSegueWithIdentifier:tableSegue sender:self];
    }
}

@end
