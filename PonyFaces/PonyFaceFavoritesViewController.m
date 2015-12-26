//
//  PonyFaceFavoritesViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/22/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "AppDelegate.h"
#import "PonyFaceFavoritesViewController.h"
#import "PonyFaceFavoritesDataSource.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface PonyFaceFavoritesViewController () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@end

@implementation PonyFaceFavoritesViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	PonyFacesTableViewController* tableViewController = self.viewControllers.firstObject;
	tableViewController.ponyFacesDataSource = [[PonyFaceFavoritesDataSource alloc] initWithTableView:tableViewController.tableView];
	tableViewController.tableView.emptyDataSetDelegate = self;
	tableViewController.tableView.emptyDataSetSource = self;
}

- (IBAction)done:(id)sender
{
	[self dismissViewControllerAnimated:YES
							 completion:^{}];
}

#pragma mark - DZNEmptyDataSetDelegate 

- (BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView
{
	return NO;
}

#pragma mark - DZNEmptyDataSetSource

- (UIImage*)imageForEmptyDataSet:(UIScrollView *)scrollView
{
	return [UIImage imageNamed:@"SillyFace"];
}

- (NSAttributedString*)titleForEmptyDataSet:(UIScrollView *)scrollView
{
	AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;

	UIFont* font = [UIFont fontWithDescriptor:[appDelegate ponyFacesFontDescriptor]
											  size:24];
	UIColor* color = [appDelegate ponyFacesMainColor];
	NSString* title = NSLocalizedString(@"No favorites yet!", @"Title for the notice that the user hasn't favorited any pony faces yet.");

	return [[NSAttributedString alloc] initWithString:title
										   attributes:@{NSFontAttributeName: font,
														NSForegroundColorAttributeName: color}];
}

- (NSAttributedString*)heartStringForEmptyDataSet
{
	UIImage* image = [UIImage imageNamed:@"SolidHeart"];

	UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, 0, image.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	CGContextSetBlendMode(context, kCGBlendModeNormal);

	CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
	CGContextClipToMask(context, rect, image.CGImage);
	[[UIColor lightGrayColor] setFill];
	CGContextFillRect(context, rect);

	image = UIGraphicsGetImageFromCurrentImageContext();

	UIGraphicsEndImageContext();

	NSTextAttachment* heartAttachment = [[NSTextAttachment alloc] init];
	heartAttachment.image = image;

	return [NSAttributedString attributedStringWithAttachment:heartAttachment];
}

- (NSAttributedString*)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
	AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;

	UIFont* font = [UIFont fontWithDescriptor:[appDelegate ponyFacesFontDescriptor]
											  size:24];
	UIColor* color = [appDelegate ponyFacesMainColor];
	NSString* desc = NSLocalizedString(@"While viewing a pony face, tap the [[heart]] button to favorite it!", @"Description for the notice that the user hasn't favorited any pony faces yet. \"[[heart]]\" will be replaced by an image of a heart.");

	NSMutableAttributedString* attributedDesc = [[NSMutableAttributedString alloc] initWithString:desc
																					   attributes:@{NSFontAttributeName: font,
																									NSForegroundColorAttributeName: color}];
	NSRange heartRange = [desc rangeOfString:@"[[heart]]"];
	if (heartRange.location != NSNotFound)
	{
		[attributedDesc replaceCharactersInRange:heartRange
							withAttributedString:[self heartStringForEmptyDataSet]];
	}

	return attributedDesc.copy;
}


@end
