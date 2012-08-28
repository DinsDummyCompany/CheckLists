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


-(void)configureCheckMarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    // create a check list object to store the values of the passed in item.
    CheckListItem *item = [listItems objectAtIndex:indexPath.row];
    
    // if the item has a check mark setup, set the accessory.  otherwise don't set it.
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
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
    
    // grab a pointer to the label we defined in IB.
    UILabel *itemLabel = (UILabel *) [cell viewWithTag:(1000)];
    
    // set the labels text to be the selected item.
    itemLabel.text = item.name;
    
    //check and set the checkmark.
    [self configureCheckMarkForCell:cell atIndexPath:indexPath];
    
    
    // send it back.
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    // create a check list object to store the values of the passed in /  selected item as per the row.
    CheckListItem *item = [listItems objectAtIndex:indexPath.row];
   
    // switch the checks depending on if it's set or now.
    item.checked = !item.checked;
    
    [self configureCheckMarkForCell:selectedCell atIndexPath:indexPath];
    
    
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
