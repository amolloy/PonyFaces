//
//  PonyTagsView.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFacesTagsView.h"

@implementation PonyFacesTagsView

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		self.insets = 8;
		self.lineSpace = 8;
	}
	return self;
}

- (void)setTagStrings:(NSArray<NSString*>*)tagStrings
{
	[self removeAllTags];
	for (NSString* tagString in tagStrings)
	{
		SKTag* tag = [SKTag tagWithText:tagString];

		tag.textColor = [UIColor whiteColor];
		tag.font = [UIFont systemFontOfSize:16];
		tag.padding = UIEdgeInsetsMake(4, 8, 4, 8);
		tag.bgColor = [UIColor purpleColor];
		tag.cornerRadius = 5;

		[self addTag:tag];
	}
}
@end
