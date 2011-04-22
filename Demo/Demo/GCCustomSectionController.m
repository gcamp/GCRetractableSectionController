//
//  GCCustomSectionController.m
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "GCCustomSectionController.h"

@interface GCCustomSectionController ()

@property (nonatomic, readonly) NSArray* content;

@end

@implementation GCCustomSectionController

@synthesize content;

#pragma mark -
#pragma mark Simple subclass

- (NSString *)title {
    return NSLocalizedString(@"Custom",);
}

- (NSUInteger)contentNumberOfRow {
    return [self.content count];
}

#pragma mark -
#pragma mark Customization

- (UITableViewCell *)cellForRow:(NSUInteger)row {
    //All cells in the GCRetractableSectionController will be indented
    UITableViewCell* cell = [super cellForRow:row];
    
    cell.indentationLevel = 1;
    
    return cell;
}

- (UITableViewCell *)titleCell {
    //I removed the detail text here, but you can do whatever you want
    UITableViewCell* titleCell = [super titleCell];
    titleCell.detailTextLabel.text = nil;
    
    return titleCell;
}

- (UITableViewCell *)contentCellForRow:(NSUInteger)row {
    //You can reuse GCRetractableSectionController work by calling super, but you can start from scratch and give a new cell
    UITableViewCell* contentCell = [super contentCellForRow:row];
    
    if (row == 0) contentCell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    else if (row == 1) contentCell.accessoryView = [[[UISwitch alloc] init] autorelease];
    else if (row == 2) contentCell.backgroundColor = [UIColor blueColor];
    
    return contentCell;
}

#pragma mark -
#pragma mark Getters 

- (NSArray *)content {
    if (content == nil) {
        content = [[NSArray alloc] initWithObjects:@"You can do", @"WHATEVER", @"you want!", nil];
    }
    return content;
}

- (void)dealloc {
    [content release];
    
    [super dealloc];
}

@end
