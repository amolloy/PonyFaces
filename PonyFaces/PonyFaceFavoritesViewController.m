//
//  PonyFaceFavoritesViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/22/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFaceFavoritesViewController.h"
#import "PonyFaceFavoritesDataSource.h"

@implementation PonyFaceFavoritesViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	PonyFacesTableViewController* tableViewController = self.viewControllers.firstObject;
	tableViewController.ponyFacesDataSource = [[PonyFaceFavoritesDataSource alloc] initWithTableView:tableViewController.tableView];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];

	// To avoid a situation where the user is viewing a favorite pony face, then switched to the search tab
	// and views the same pony face, then toggles the favorite status off, go ahead and back out to the
	// favorites table view whenever the favorites tab is left.
	[self popToRootViewControllerAnimated:animated];
}

@end
