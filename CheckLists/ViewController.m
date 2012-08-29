//
//  ViewController.m
//  CheckLists
//
//  Created by Jonathan Carnie on 28/08/12.
//  Copyright (c) 2012 Jonathan Carnie. All rights reserved.
//

#import "ViewController.h"
#import "CheckListItem.h"


@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *listItems;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create an array to hold our list of items.
    listItems = [[NSMutableArray alloc] initWithCapacity:20];
    
    // define a item object where we'll store some details
    CheckListItem *item;
    
    //allocate and set the acutal details of the check list item.
    item = [[CheckListItem alloc] init];
    item.name = @"Walk the Dog";
    item.checked = NO;
    // add the item to the array
    [listItems addObject:item];
    
    // allocate another object and set some values to it.
    item = [[CheckListItem alloc] init];
    item.name = @"Brush my teeth";
    item.checked = NO;
    // add it to the array.
    [listItems addObject:item];
    
    // allocate another object and set some values to it.
    item = [[CheckListItem alloc] init];
    item.name = @"Learn Objective-C";
    item.checked = NO;
    // add it to the array.
    [listItems addObject:item];
    
    // allocate another object and set some values to it.
    item = [[CheckListItem alloc] init];
    item.name = @"Pick up kids";
    item.checked = NO;
    // add it to the array.
    [listItems addObject:item];
    
    // allocate another object and set some values to it.
    item = [[CheckListItem alloc] init];
    item.name = @"Wash the car";
    item.checked = NO;
    // add it to the array.
    [listItems addObject:item];
    
    // allocate another object and set some values to it.
    item = [[CheckListItem alloc] init];
    item.name = @"Go to Bed!";
    item.checked = YES;
    // add it to the array.
    [listItems addObject:item];
    
    
    
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void)configureCheckMarkForCell:(UITableViewCell *)cell withChecklistItem:(CheckListItem *) item
{
    
    // if the item has a check mark setup, set the accessory.  otherwise don't set it.
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
}


-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(CheckListItem *)item
{
    // grab a pointer to the label we defined in IB.
    UILabel *itemLabel = (UILabel *) [cell viewWithTag:(1000)];
    
    // set the labels text to be the selected item.
    itemLabel.text = item.name;

}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listItems count];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // create a cell to use.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CheckListItem"];
    

    // create a check list object to store the values of the passed in /  selected item as per the row.
    CheckListItem *item = [listItems objectAtIndex:indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    
    [self configureCheckMarkForCell:cell withChecklistItem:item];
    
    // send it back.
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    // create a check list object to store the values of the passed in /  selected item as per the row.
    CheckListItem *item = [listItems objectAtIndex:indexPath.row];
   
    [item toggleChecked];
    
    [self configureCheckMarkForCell:selectedCell withChecklistItem:item];
       
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)addCheckItem:(UIBarButtonItem *)sender {
    
    
    // get the number of the last index item.
    int newRowIndex = [listItems count];
    
    // create a new check list item object. - add some details to it.
    CheckListItem *item = [[CheckListItem alloc] init];
    item.name = @"I am a new Item!";
    item.checked = NO;
    // add the item to the array.
    [listItems addObject:item];
    
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [listItems removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}








@end
