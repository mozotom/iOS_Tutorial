//
//  tmxAddNoteViewController.h
//  EveryNote
//
//  Created by Tomasz Mozolewski on 6/24/14.
//  Copyright (c) 2014 Tomasz Mozolewski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tmxAddNoteViewController;

@protocol AddNoteDelegate
-(void) savedNote:(tmxAddNoteViewController*)controller;
@end


@interface tmxAddNoteViewController : UITableViewController <AddNoteDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) id<AddNoteDelegate> delegate;

@end
