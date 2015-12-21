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
#import "BENTagsView.h"

@interface PonyFaceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel* categoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnailView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicatorView;
@property (weak, nonatomic) IBOutlet BENTagsView* tagsView;
@end

@implementation PonyFaceTableViewCell

- (void)awakeFromNib
{
	[self.tagsView setFont:[UIFont systemFontOfSize:16]];
	[self.tagsView setTagCornerRadius:8];
	[self.tagsView setOffColor:[UIColor purpleColor]];
}

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
	[self.tagsView setTagStrings:ponyFace.tags];
}

@end
