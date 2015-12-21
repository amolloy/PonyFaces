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

@end
