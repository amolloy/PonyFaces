//
//  PonyFacesTableViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFacesTableViewController.h"
#import "PonyFaceTableViewCell.h"
#import "PonyFace.h"
#import "PonyFaceModel.h"
#import "PonyFaceDetailViewController.h"
#import <FXReachability/FXReachability.h>
#import <PINRemoteImage/PINRemoteImageManager.h>
#import "AppDelegate.h"

@interface PonyFacesTableViewController () <PonyFaceDetailViewControllerDelegate>
@property (nonatomic, copy) NSArray* thumbnailPrecacheTaskIDs;
@end

@implementation PonyFacesTableViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	if ([FXReachability sharedInstance].status == FXReachabilityStatusReachableViaWiFi)
	{
		NSMutableArray* taskIDs = [NSMutableArray array];

		AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
		NSInteger numCategories = [self.ponyFacesDataSource numberOfCategories];
		for (NSInteger categoryIndex = 0; categoryIndex < numCategories; ++categoryIndex)
		{
			NSInteger numRows = [self.ponyFacesDataSource numberOfPonyFacesInCategoryAtIndex:categoryIndex];

			for (NSInteger rowIndex = 0; rowIndex < numRows; ++rowIndex)
			{
				id<PonyFaceModel> ponyFace = [self.ponyFacesDataSource ponyFaceForCategoryIndex:categoryIndex
																							row:rowIndex];

				__weak typeof(self) wself = self;
				NSUUID* taskID = [[PINRemoteImageManager sharedImageManager] downloadImageWithURL:ponyFace.thumbnailURL
																					   completion:^(PINRemoteImageManagerResult *result)
								  {
									  dispatch_async(dispatch_get_main_queue(), ^{
										  __strong typeof(self) sself = wself;

										  [appDelegate setNetworkActivityIndicatorVisible:NO];

										  NSMutableArray* newTaskIDs = sself.thumbnailPrecacheTaskIDs.mutableCopy;
										  [newTaskIDs removeObject:result.UUID];
										  sself.thumbnailPrecacheTaskIDs = newTaskIDs;
									  });
								  }];
				if (taskID)
				{
					[appDelegate setNetworkActivityIndicatorVisible:YES];
					[taskIDs addObject:taskID];
				}
			}
		}

		self.thumbnailPrecacheTaskIDs = taskIDs;
	}

	self.navigationItem.title = [self.ponyFacesDataSource navigationItemTitle];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];

	AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
	for (NSUUID* taskID in self.thumbnailPrecacheTaskIDs)
	{
		[appDelegate setNetworkActivityIndicatorVisible:NO];
		[[PINRemoteImageManager sharedImageManager] cancelTaskWithUUID:taskID];
	}
	self.thumbnailPrecacheTaskIDs = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.ponyFacesDataSource numberOfCategories];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.ponyFacesDataSource numberOfPonyFacesInCategoryAtIndex:section];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
	return [self.ponyFacesDataSource titleForCategoryAtIndex:section];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	PonyFaceTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PonyFaceTableViewCell"
																  forIndexPath:indexPath];
	cell.ponyFace = [self.ponyFacesDataSource ponyFaceForCategoryIndex:indexPath.section
																   row:indexPath.row];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 155;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.destinationViewController respondsToSelector:@selector(setPonyFace:)])
	{
		PonyFaceTableViewCell* cell = sender;
		[segue.destinationViewController setPonyFace:cell.ponyFace];
	}
	if ([segue.destinationViewController respondsToSelector:@selector(setDelegate:)])
	{
		[segue.destinationViewController setDelegate:self];
	}
}

#pragma mark - PonyFaceFavoritesDataSourceDelegate

- (void)ponyFaceAtIndexPath:(NSIndexPath *)indexPath wasUpdatedTo:(id<PonyFaceModel>)ponyFace
{
	PonyFaceTableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
	cell.ponyFace = ponyFace;
}

#pragma mark - PonyFaceDetailViewControllerDelegate

- (UIViewController*)activityPresentingViewControllerForPonyFaceDetailViewController:(PonyFaceDetailViewController*)controller
{
	return self;
}

@end

