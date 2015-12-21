//
//  PonyFaceSearchResultsDataSource.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PonyFacesTableViewController.h"

@class PonyFaceCategory;

@interface PonyFaceSearchResultsDataSource : NSObject <PonyFacesTableViewControllerDataSource>
- (id)initWithSearchResults:(NSArray<PonyFaceCategory*>*)searchResults;
@end
