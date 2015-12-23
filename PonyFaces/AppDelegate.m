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

- (UIFontDescriptor*)ponyFacesFontDescriptor
{
	UIFontDescriptor* descriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorNameAttribute: @"Noteworthy-Bold"}];

	return descriptor;
}

- (UIColor*)ponyFacesMainColor
{
	return [UIColor colorWithRed:0xFC / (CGFloat)0xFF
						   green:0x6C / (CGFloat)0xFF
							blue:0xB3 / (CGFloat)0xFF
						   alpha:1];
}

- (void)setupAppearance
{
	UIFont* titleFont = [UIFont fontWithDescriptor:[self ponyFacesFontDescriptor]
											  size:24];
	[[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: titleFont,
														   NSForegroundColorAttributeName: [self ponyFacesMainColor]}];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self setupAppearance];

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
