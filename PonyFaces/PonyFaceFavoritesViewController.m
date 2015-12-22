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

@end
