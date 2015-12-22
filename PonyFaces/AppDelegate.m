//
//  AppDelegate.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "AppDelegate.h"
#import "FavoritePonyFacesManager.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[FavoritePonyFacesManager sharedManager] setupCoreDataStack];

	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[[FavoritePonyFacesManager sharedManager] cleanUp];
}

- (void)setNetworkActivityIndicatorVisible:(BOOL)visible
{
	static NSInteger sNetworkActivityIndicatorVisibleCount = 0;

	if (visible)
	{
		sNetworkActivityIndicatorVisibleCount+= 1;
	}
	else
	{
		sNetworkActivityIndicatorVisibleCount = MAX(0, sNetworkActivityIndicatorVisibleCount - 1);
	}

	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:sNetworkActivityIndicatorVisibleCount != 0];
}

@end
