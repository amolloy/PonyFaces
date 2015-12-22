//
//  PonyFaceTableViewCell.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "AppDelegate.h"
#import "PonyFaceTableViewCell.h"
#import "UIImageView+PINRemoteImage.h"
#import "PonyFacesTagsView.h"

@interface PonyFaceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel* categoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnailView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicatorView;
@property (weak, nonatomic) IBOutlet PonyFacesTagsView* tagsView;
@end

@implementation PonyFaceTableViewCell

- (void)prepareForReuse
{
	self.thumbnailView.image = nil;
	[self.activityIndicatorView startAnimating];
}

- (void)setPonyFace:(id<PonyFaceModel>)ponyFace
{
	_ponyFace = ponyFace;

	self.categoryLabel.text = ponyFace.categoryName;
	[(AppDelegate*)[UIApplication sharedApplication].delegate setNetworkActivityIndicatorVisible:YES];
	[self.thumbnailView pin_setImageFromURL:ponyFace.thumbnailURL completion:^(PINRemoteImageManagerResult *result) {
		[(AppDelegate*)[UIApplication sharedApplication].delegate setNetworkActivityIndicatorVisible:NO];
		[self.activityIndicatorView stopAnimating];
	}];
	[self.tagsView setTagStrings:ponyFace.tags];
}

@end
