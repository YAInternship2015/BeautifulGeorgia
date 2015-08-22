//
//  NDTableViewController.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

//controllers
#import "NDTableViewController.h"

//models
#import "NDNamedImageModel.h"

//views
#import "NDHeaderView.h"
#import "NDTableViewCell.h"

//sources
#import "NDDataSource.h"

@interface NDTableViewController ()

@property (strong, nonatomic) NSArray *images;

@end

@implementation NDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHeaderNib];
    self.images = [NDDataSource getNamedImages];
}

- (void)loadHeaderNib {
    NSString *headerName = NSStringFromClass([NDHeaderView class]);
    UINib* headerNib = [UINib nibWithNibName:headerName bundle:nil];
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier:headerName];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.images count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    NDNamedImageModel *model = [self.images objectAtIndex:indexPath.row];
    [cell fill:model];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NDHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier: NSStringFromClass([NDHeaderView class])];
    return headerView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - TransitionCoordinator

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
     }];
}

@end
