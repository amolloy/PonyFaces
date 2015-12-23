//
//  PonyFaceDetailViewController.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PonyFaceModel.h"

@protocol PonyFaceDetailViewControllerDelegate;

@interface PonyFaceDetailViewController : UIViewController
@property (nonatomic, strong) id<PonyFaceModel> ponyFace;
@property (nonatomic, weak) id<PonyFaceDetailViewControllerDelegate> delegate;
@end

@protocol PonyFaceDetailViewControllerDelegate <NSObject>
- (UIViewController*)activityPresentingViewControllerForPonyFaceDetailViewController:(PonyFaceDetailViewController*)controller;
@end
