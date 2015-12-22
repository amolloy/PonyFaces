//
//  FavoritePonyFacesManager.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PonyFaceModel.h"

@class NSManagedObjectContext;

@interface FavoritePonyFacesManager : NSObject
+ (id)sharedManager;

- (void)setupCoreDataStack;
- (void)cleanUp;

- (void)addFavoritePonyFace:(id<PonyFaceModel>)ponyFace managedObjectContext:(NSManagedObjectContext*)moc;
- (BOOL)isPonyFaceAFavorite:(id<PonyFaceModel>)ponyFace managedObjectContext:(NSManagedObjectContext*)moc;
- (void)deleteFavoritePonyFace:(id<PonyFaceModel>)ponyFace managedObjectContext:(NSManagedObjectContext*)moc;
@end
