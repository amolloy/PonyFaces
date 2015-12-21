//
//  PonyFaceDetailViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFaceDetailViewController.h"
#import "PonyFace.h"
#import "PonyFaceCategory.h"
#import "UIImageView+PINRemoteImage.h"
#import "BENTagsView.h"

static void* const sPonyFaceObvserverContext = (void*)&sPonyFaceObvserverContext;

@interface PonyFaceDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel* categoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView* imageView;
@property (weak, nonatomic) IBOutlet BENTagsView* tagsView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicatorView;

@end

@implementation PonyFaceDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
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
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
	if (sPonyFaceObvserverContext == context)
	{
		if (self.ponyFace)
		{
			self.categoryLabel.text = self.ponyFace.category.name;
			[self.activityIndicatorView startAnimating];
			[self.imageView pin_setImageFromURL:self.ponyFace.imageURL completion:^(PINRemoteImageManagerResult *result) {
				[self.activityIndicatorView stopAnimating];
			}];
			[self.tagsView setTagStrings:self.ponyFace.tags];
		}
		else
		{
			self.categoryLabel.text = @"";
			self.imageView.image = nil;
			[self.tagsView setTagStrings:@[]];
		}
	}
}

@end
