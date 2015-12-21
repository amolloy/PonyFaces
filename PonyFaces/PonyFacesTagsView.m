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
		[self setFont:[UIFont systemFontOfSize:16]];
		[self setTagCornerRadius:8];
		[self setOffColor:[UIColor purpleColor]];
	}
	return self;
}

@end
