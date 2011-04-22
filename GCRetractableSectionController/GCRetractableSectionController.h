//
//  GCRetractableSectionController.h
//  Mtl mobile
//
//  Created by Guillaume Campagna on 09-10-19.
//  Copyright 2009 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCRetractableSectionController : NSObject

@property (nonatomic, assign) BOOL open;

- (id) initWithViewController:(UIViewController*) givenViewController;

//Used by the UITableView's dataSource
- (UITableViewCell*) cellForRow:(NSUInteger) row;
@property (nonatomic, readonly) NSUInteger numberOfRow;

//Must be subclassed to work properly
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSUInteger contentNumberOfRow;
- (NSString*) titleContentForRow:(NSUInteger) row;

//Can be subclassed for more control
- (UITableViewCell*) titleCell;
- (UITableViewCell*) contentCellForRow:(NSUInteger) row;

//Respond to cell selection
- (void) didSelectCellAtRow:(NSUInteger) row;
- (void) didSelectTitleCell;
- (void) didSelectContentCellAtRow:(NSUInteger) row;


@end
