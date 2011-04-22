//
//  GCRetractableSectionController.h
//  Mtl mobile
//
//  Created by Guillaume Campagna on 09-10-19.
//  Copyright 2009 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCRetractableSectionController : NSObject

@property (nonatomic, assign) UIViewController *viewController;
@property (nonatomic, assign) BOOL open;

@property (nonatomic, readonly) NSUInteger numberOfRow;
@property (nonatomic, readonly) NSUInteger contentNumberOfRow;
@property (nonatomic, readonly) NSString* title;

- (id) initWithViewController:(UIViewController*) givenViewController;

- (UITableViewCell*) cellForRow:(NSUInteger) row;
- (UITableViewCell*) titleCell;
- (UITableViewCell*) contentCellForRow:(NSUInteger) row;

- (void) setAccesoryViewOnCell:(UITableViewCell*) cell;

- (void) didSelectCellAtRow:(NSUInteger) row;
- (void) didSelectTitleCell;
- (void) didSelectContentCellAtRow:(NSUInteger) row;

- (NSString*) titleContentForRow:(NSUInteger) row;

@end
