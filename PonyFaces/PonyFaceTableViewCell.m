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

@interface PonyFaceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel* categoryLabel;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnailView;
@end

@implementation PonyFaceTableViewCell

- (void)setPonyFace:(PonyFace*)ponyFace
{
	_ponyFace = ponyFace;

	self.categoryLabel.text = ponyFace.category.name;
}

@end
