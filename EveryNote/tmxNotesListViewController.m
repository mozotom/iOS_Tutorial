//
//  tmxNotesListViewController.m
//  EveryNote
//
//  Created by Tomasz Mozolewski on 6/24/14.
//  Copyright (c) 2014 Tomasz Mozolewski. All rights reserved.
//

#import "tmxNotesListViewController.h"
#import "tmxAddNoteViewController.h"

@interface tmxNotesListViewController () <AddNoteDelegate> {
    NSMutableArray* notes;
}

@end

@implementation tmxNotesListViewController

-(void) savedNote:(tmxAddNoteViewController*) controller {
    [notes addObject: controller.titleField.text];
    [[self tableView] reloadData];
    [controller.navigationController popToRootViewControllerAnimated:YES];
}

-(void) prepareForSegue:(UIStoryboardSegue*) segue sender:(id) sender {
    if ([segue.identifier isEqualToString:@"Add Note Segue"]) {
        tmxAddNoteViewController *addNoteVC = segue.destinationViewController;
        addNoteVC.delegate = self;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    notes = [NSMutableArray arrayWithObjects: @"Note1", @"Note2", nil];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView*) tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Note Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [notes objectAtIndex: indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [notes count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
