//
//  PonyFaceTableViewCell.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFaceTableViewCell.h"
#import "PonyFace.h"
#import "PonyFaceCategory.h"
#import "UIImageView+PINRemoteImage.h"

@interface PonyFaceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel* categoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnailView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicatorView;
@end

@implementation PonyFaceTableViewCell

- (void)prepareForReuse
{
	self.thumbnailView.image = nil;
	[self.activityIndicatorView startAnimating];
}

- (void)setPonyFace:(PonyFace*)ponyFace
{
	_ponyFace = ponyFace;

	self.categoryLabel.text = ponyFace.category.name;
	[self.thumbnailView pin_setImageFromURL:ponyFace.thumbnailURL completion:^(PINRemoteImageManagerResult *result) {
		[self.activityIndicatorView stopAnimating];
	}];
}

@end
