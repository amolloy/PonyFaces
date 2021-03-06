//
//  PonyFacesTableViewController.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PonyFaceModel.h"

@protocol PonyFacesTableViewControllerDataSource;

@interface PonyFacesTableViewController : UITableViewController
@property (nonatomic, strong) id<PonyFacesTableViewControllerDataSource> ponyFacesDataSource;
@end

@class PonyFace;
@protocol PonyFacesTableViewControllerDataSource <NSObject>
- (NSInteger)numberOfCategories;
- (NSInteger)numberOfPonyFacesInCategoryAtIndex:(NSInteger)index;

- (NSString*)titleForCategoryAtIndex:(NSInteger)index;
- (id<PonyFaceModel>)ponyFaceForCategoryIndex:(NSInteger)index row:(NSInteger)row;

- (NSString*)navigationItemTitle;
@end
