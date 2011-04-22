//
//  GCRetractableSectionController.m
//  Mtl mobile
//
//  Created by Guillaume Campagna on 09-10-19.
//  Copyright 2009 LittleKiwi. All rights reserved.
//

#import "GCRetractableSectionController.h"

@interface GCRetractableSectionController ()

@property (nonatomic, assign) UIViewController *viewController;
@property (nonatomic, readonly) UITableView *tableView;

- (void) setAccessoryViewOnCell:(UITableViewCell*) cell;

@end

@implementation GCRetractableSectionController

@synthesize viewController;
@synthesize open;

#pragma mark -
#pragma mark Initialisation

- (id) initWithViewController:(UIViewController*) givenViewController {
	if ((self = [super init])) {
        if (![givenViewController respondsToSelector:@selector(tableView)]) {
            //The view controller MUST have a tableView proprety
            [NSException raise:@"Wrong view controller" 
                        format:@"The passed view controller to GCRetractableSectionController must respond to the tableView proprety"];
        }
        
		self.viewController = givenViewController;
		self.open = NO;
	}
	return self;
}

#pragma mark -
#pragma mark Getters

- (UITableView*) tableView {
	return [self.viewController performSelector:@selector(tableView)];
}

- (NSUInteger) numberOfRow {
    return (self.open) ? self.contentNumberOfRow + 1 : 1;
}

- (NSUInteger) contentNumberOfRow {
	return 0;
}

- (NSString*) title {
	return NSLocalizedString(@"No title",);
}

- (NSString*) titleContentForRow:(NSUInteger) row {
	return NSLocalizedString(@"No title",);
}

#pragma mark -
#pragma mark Cells

- (UITableViewCell *) cellForRow:(NSUInteger)row {
	UITableViewCell* cell = nil;
	
	if (row == 0) {
		cell = [self titleCell];
		if (self.contentNumberOfRow != 0) [self setAccessoryViewOnCell:cell];
	}
	else cell = [self contentCellForRow:row - 1];
	
	return cell;
}

- (UITableViewCell *) titleCell {
	static NSString* titleCellIdentifier = @"TitleCellIdentifier";
	
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier] autorelease];
	}
	
	cell.textLabel.text = self.title;
	if (self.contentNumberOfRow != 0) {
		cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%i items",), self.contentNumberOfRow];
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}
	else {
		cell.detailTextLabel.text = NSLocalizedString(@"No item",);
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	return cell;
}

- (UITableViewCell *) contentCellForRow:(NSUInteger)row {
	static NSString* contentCellIdentifier = @"contentCellIdentifier";
	
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:contentCellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:contentCellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	cell.textLabel.text = [self titleContentForRow:row];
	
	return cell;
}

- (void) setAccessoryViewOnCell:(UITableViewCell*) cell {
	NSString* path = nil;
	if (self.open) {
		path = @"UpAcessory.png";
		cell.textLabel.textColor = [UIColor colorWithRed:0.191 green:0.264 blue:0.446 alpha:1.000];
	}	
	else {
		path = @"DownAcessory.png";
		cell.textLabel.textColor = [UIColor blackColor];
	}
	
	UIImage* acessoryImage = [UIImage imageNamed:path];
	UIImage* whiteAcessoryImage = [UIImage imageNamed:[[path stringByDeletingPathExtension] stringByAppendingString:@"White.png"]];
	
	UIImageView* imageView;
	if (cell.accessoryView != nil) {
		imageView = (UIImageView*) cell.accessoryView;
		imageView.image = acessoryImage;
		imageView.highlightedImage = whiteAcessoryImage;
    }
	else {
		imageView = [[UIImageView alloc] initWithImage:acessoryImage];
		imageView.highlightedImage = whiteAcessoryImage;
		cell.accessoryView = imageView;
		[imageView release];
	}
}

#pragma mark -
#pragma mark Select Cell

- (void) didSelectCellAtRow:(NSUInteger)row {
	if (row == 0) [self didSelectTitleCell];
	else [self didSelectContentCellAtRow:row - 1];
}

- (void) didSelectTitleCell {
	self.open = !self.open;
	if (self.contentNumberOfRow != 0) [self setAccessoryViewOnCell:[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]]];
	
	NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
	NSUInteger section = indexPath.section;
	NSUInteger contentCount = self.contentNumberOfRow;
	
	[self.tableView beginUpdates];
	
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (self.open) [self.tableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
	else [self.tableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
	[rowToInsert release];
	
	[self.tableView endUpdates];
	
	if (self.open) [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) didSelectContentCellAtRow:(NSUInteger)row {}

@end
