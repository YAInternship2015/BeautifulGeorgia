//
//  NDCollectionViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/23/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDCollectionViewController.h"
#import "NDCollectionViewCell.h"
#import "UIViewController+NDAlertDisplaying.h"
#import "NDDataStorage.h"
#import <CoreData/NSFetchedResultsController.h>

@interface NDCollectionViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (nonatomic, strong) NDDataStorage *dataStorage;
@property (nonatomic, strong) NSMutableArray *itemChanges;

@end

@implementation NDCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataStorage = [[NDDataStorage alloc] initWithFetchedResultsControllerDelegate:self];
}

- (IBAction)handleLongPressGestureRecognizer:(UILongPressGestureRecognizer *)sender {
    CGPoint pressLocation = [sender locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:pressLocation];
    if (sender.state == UIGestureRecognizerStateBegan && indexPath) {
        [self showActionAlertWithTitle:(NSLocalizedString(@"DeleteTitleKey", nil))
                                  text:(NSLocalizedString(@"DeleteTextKey", nil))
                                accept:(NSLocalizedString(@"YesKey", nil))
                                reject:(NSLocalizedString(@"CancelKey", nil)) onAccept:^{
                                    NSError *error = nil;
#warning использование strong ссылки на self в блоке может привести к retain cycle, в блоке надо использовать weak ссылку на self
                                    [self.dataStorage removeObject:[self.dataStorage objectAtIndex:indexPath] error:error];
                                    if (error) {
                                        [self showErrorAlertWithText:[error localizedDescription] onAccept:nil];
                                    }
                                } onReject:nil];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataStorage numberOfObjects];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    NDNamedImage *model = [self.dataStorage objectAtIndex:indexPath];
    [cell fillWithNamedImage:model];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView*)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat sectionInset = self.collectionViewFlowLayout.sectionInset.right + self.collectionViewFlowLayout.sectionInset.left;
    CGFloat minSpacingInset = self.collectionViewFlowLayout.minimumLineSpacing;
    
    NSInteger itemsInRowFactor = 0;

    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if ((orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown) &&
        [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        itemsInRowFactor = 1;
    } else if ((orientation == UIInterfaceOrientationLandscapeLeft ||
               orientation == UIInterfaceOrientationLandscapeRight) &&
               [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        itemsInRowFactor = 3;
    } else {
        itemsInRowFactor = 2;
    }
    
    CGFloat side = [self calculateSide:collectionView sectionInset:sectionInset minSpacingInset:minSpacingInset itemsInRowFactor:itemsInRowFactor];

    return CGSizeMake(side/(2 * itemsInRowFactor), side/(3 * itemsInRowFactor));;
}

- (CGFloat)calculateSide:(UICollectionView *)collectionView
            sectionInset:(CGFloat)sectionInset
         minSpacingInset:(CGFloat)minSpacingInset
        itemsInRowFactor:(NSInteger)itemsInRowFactor {
    return (collectionView.bounds.size.width - sectionInset - 2 * minSpacingInset * itemsInRowFactor);
}


#pragma mark - TransitionCoordinator

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [self.collectionView performBatchUpdates:nil completion:nil];
     } completion:nil];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    self.itemChanges = [[NSMutableArray alloc] init];
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    NSMutableDictionary *change = [[NSMutableDictionary alloc] init];
    switch(type) {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = newIndexPath;
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeUpdate:
            break;
        case NSFetchedResultsChangeMove:
            break;
    }
    [self.itemChanges addObject:change];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.collectionView performBatchUpdates:^{

        for (NSDictionary *change in self.itemChanges) {
            [change enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                NSFetchedResultsChangeType type = [key unsignedIntegerValue];
                switch(type) {
                    case NSFetchedResultsChangeInsert:
                        [self.collectionView insertItemsAtIndexPaths:@[obj]];
                        break;
                    case NSFetchedResultsChangeDelete:
                        [self.collectionView deleteItemsAtIndexPaths:@[obj]];
                        break;
                    case NSFetchedResultsChangeUpdate:
                        break;
                    case NSFetchedResultsChangeMove:
                        break;
                }
            }];
        }
    } completion:^(BOOL finished) {
        self.itemChanges = nil;
    }];
}

@end
