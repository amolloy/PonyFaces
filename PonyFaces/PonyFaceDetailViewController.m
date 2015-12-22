//
//  PonyFaceDetailViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "AppDelegate.h"
#import "PonyFaceDetailViewController.h"
#import "PonyFace.h"
#import "PonyFaceCategory.h"
#import "UIImageView+PINRemoteImage.h"
#import "PonyFacesTagsView.h"
#import "FavoritePonyFacesManager.h"
#import "FavoritePonyFace.h"
#import "SYFavoriteButton.h"
#import <MagicalRecord/MagicalRecord.h>

static void* const sPonyFaceObvserverContext = (void*)&sPonyFaceObvserverContext;

@interface PonyFaceDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel* categoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView* imageView;
@property (weak, nonatomic) IBOutlet PonyFacesTagsView* tagsView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicatorView;
@property (weak, nonatomic) IBOutlet SYFavoriteButton* favoriteButton;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@end

@implementation PonyFaceDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	self.managedObjectContext = [NSManagedObjectContext MR_context];

	[self addObserver:self
		   forKeyPath:@"ponyFace"
			  options:NSKeyValueObservingOptionInitial
			  context:sPonyFaceObvserverContext];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[self removeObserver:self
			  forKeyPath:@"ponyFace"];

	[self.managedObjectContext MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError* error) {
		if (!contextDidSave && error)
		{
			NSLog(@"Couldn't save changes: %@", error);
		}
	}];
}

- (IBAction)favorite:(id)sender
{
	BOOL isFavorite = [[FavoritePonyFacesManager sharedManager] isPonyFaceAFavorite:self.ponyFace
															   managedObjectContext:self.managedObjectContext];
	if (isFavorite)
	{
		[[FavoritePonyFacesManager sharedManager] deleteFavoritePonyFace:self.ponyFace
													managedObjectContext:self.managedObjectContext];
	}
	else
	{
		[[FavoritePonyFacesManager sharedManager] addFavoritePonyFace:self.ponyFace
												 managedObjectContext:self.managedObjectContext];
	}

	[self.favoriteButton setSelected:!isFavorite];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
	if (sPonyFaceObvserverContext == context)
	{
		if (self.ponyFace)
		{
			self.categoryLabel.text = self.ponyFace.categoryName;
			[self.activityIndicatorView startAnimating];
			[(AppDelegate*)[UIApplication sharedApplication].delegate setNetworkActivityIndicatorVisible:YES];
			[self.imageView pin_setImageFromURL:self.ponyFace.imageURL completion:^(PINRemoteImageManagerResult *result) {
				[(AppDelegate*)[UIApplication sharedApplication].delegate setNetworkActivityIndicatorVisible:NO];
				[self.activityIndicatorView stopAnimating];
			}];
			[self.tagsView setTagStrings:self.ponyFace.tags];

			BOOL isFavorite = [[FavoritePonyFacesManager sharedManager] isPonyFaceAFavorite:self.ponyFace
																	   managedObjectContext:self.managedObjectContext];
			[self.favoriteButton setSelected:isFavorite];
			self.favoriteButton.enabled = YES;
		}
		else
		{
			self.categoryLabel.text = @"";
			self.imageView.image = nil;
			[self.tagsView setTagStrings:@[]];
			self.favoriteButton.enabled = NO;
		}
	}
}

@end
