//
//  PonyFaceTableViewCell.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PonyFace;

@interface PonyFaceTableViewCell : UITableViewCell
@property (nonatomic, strong) PonyFace* ponyFace;
@end
