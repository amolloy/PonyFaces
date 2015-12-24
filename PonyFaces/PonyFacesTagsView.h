//
//  PonyTagsView.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <SKTagView/SKTagView.h>

IB_DESIGNABLE
@interface PonyFacesTagsView : SKTagView

@property (assign, nonatomic) IBInspectable CGFloat fontSize;

- (void)setTagStrings:(NSArray<NSString*>*)tagStrings;

@end
