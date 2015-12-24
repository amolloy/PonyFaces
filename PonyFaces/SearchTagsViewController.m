//
//  SearchTagsViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "SearchTagsViewController.h"
#import "PonyFacesAPI.h"
#import "PonyFacesTableViewController.h"
#import "PonyFaceSearchResultsDataSource.h"

static NSString* const ShowSearchResultsSegue = @"ShowSearchResults";
static NSString* const HappyPonyFaceImageName = @"HappyFace";
static NSString* const SadPonyFaceImageName = @"SadFace";
static const NSTimeInterval NoResultsAnimationDuration = 0.5;

@interface SearchTagsViewController () <UITextFieldDelegate, UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField* searchTextField;
@property (weak, nonatomic) IBOutlet UIButton* searchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (weak, nonatomic) IBOutlet UIView* noResultsView;
@property (weak, nonatomic) IBOutlet UIImageView* ponyFaceImageView;
@property (strong, nonatomic) PonyFaceSearchResultsDataSource* searchResults;
@property (assign, nonatomic) BOOL noResultsViewIsVisible;
@end

@implementation SearchTagsViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	self.searchTextField.enabled = YES;
	self.searchResults = nil;
	[self.activityIndicator stopAnimating];
	self.searchButton.enabled = (self.searchTextField.text.length != 0);
}

- (IBAction)search:(id)sender
{
	self.searchTextField.enabled = NO;
	self.searchButton.enabled = NO;
	[self.activityIndicator startAnimating];

	NSString* query = [self.searchTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

	__weak typeof(self) wself = self;
	[PonyFacesAPI performSearchForTag:query
						   completion:^(NSArray* results, NSError* error) {
							   dispatch_async(dispatch_get_main_queue(), ^{
								   __strong typeof(self) sself = wself;
								   [sself searchCompletedWithResults:results
															   error:error];
							   });
						   }];
}

- (void)searchCompletedWithResults:(NSArray*)results error:(NSError*)error
{
	[self.activityIndicator stopAnimating];

	if (error)
	{
		UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"Error"
																			message:error.localizedDescription
																	 preferredStyle:UIAlertControllerStyleAlert];
		[controller addAction:[UIAlertAction actionWithTitle:@"Ok"
													   style:UIAlertActionStyleDefault
													 handler:nil]];
		[self presentViewController:controller
						   animated:YES
						 completion:nil];

		self.searchTextField.enabled = YES;
	}
	else
	{
		if (results.count != 0)
		{
			self.searchResults = [[PonyFaceSearchResultsDataSource alloc] initWithSearchResults:results];
			[self performSegueWithIdentifier:ShowSearchResultsSegue
									  sender:self];
		}
		else
		{
			self.searchTextField.enabled = YES;
			self.noResultsViewIsVisible = YES;
			[UIView transitionWithView:self.ponyFaceImageView
							  duration:NoResultsAnimationDuration
							   options:UIViewAnimationOptionTransitionCrossDissolve
							animations:^{
								self.noResultsView.hidden = NO;
								self.ponyFaceImageView.image = [UIImage imageNamed:SadPonyFaceImageName];
							}
							completion:nil];
		}
	}
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.destinationViewController respondsToSelector:@selector(setPonyFacesDataSource:)])
	{
		[segue.destinationViewController setPonyFacesDataSource:self.searchResults];
	}

	if (segue.destinationViewController.popoverPresentationController != nil)
	{
		segue.destinationViewController.popoverPresentationController.delegate = self;
	}
}

- (void)hideNoResultsViewIfNeeded
{
	if (self.noResultsViewIsVisible)
	{
		self.noResultsViewIsVisible = NO;
		[UIView transitionWithView:self.ponyFaceImageView
						  duration:NoResultsAnimationDuration
						   options:UIViewAnimationOptionTransitionCrossDissolve
						animations:^{
							self.noResultsView.hidden = YES;
							self.ponyFaceImageView.image = [UIImage imageNamed:HappyPonyFaceImageName];
						}
						completion:nil];
	}
}

#pragma mark Popover Presentation Controller Delegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
	return UIModalPresentationNone;
}

#pragma mark Text field delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
	self.searchButton.enabled = newString.length != 0;
	[self hideNoResultsViewIfNeeded];

	return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
	[self hideNoResultsViewIfNeeded];

	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
	[self search:textField];
	return YES;
}

@end
