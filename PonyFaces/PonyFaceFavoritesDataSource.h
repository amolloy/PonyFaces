//
//  PonyFaceFavoritesDataSource.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/22/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "PonyFacesTableViewController.h"

@interface PonyFaceFavoritesDataSource : NSObject <PonyFacesTableViewControllerDataSource>
- (instancetype)initWithTableView:(UITableView*)tableView;
@end

