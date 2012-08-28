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
    CheckListItem *row0Item;
    CheckListItem *row1Item;
    CheckListItem *row2Item;
    CheckListItem *row3Item;
    CheckListItem *row4Item;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    row0Item = [[CheckListItem alloc] init];
    row0Item.name = @"Walk the Dog";
    row0Item.checked = NO;
    
    row1Item = [[CheckListItem alloc] init];
    row1Item.name = @"Brush my teeth";
    row1Item.checked = NO;
    
    row2Item = [[CheckListItem alloc] init];
    row2Item.name = @"Learn Objective-C";
    row2Item.checked = NO;
    
    row3Item = [[CheckListItem alloc] init];
    row3Item.name = @"Pick up kids";
    row3Item.checked = NO;
    
    row4Item = [[CheckListItem alloc] init];
    row4Item.name = @"Wash the car";
    row4Item.checked = NO;
    
    
    
	
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void)configureCheckMarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    BOOL isChecked = NO;
    if (indexPath.row == 0) {
        isChecked = row0Item.checked;
    } else if (indexPath.row == 1) {
        isChecked = row1Item.checked;
    } else if (indexPath.row == 2) {
        isChecked = row2Item.checked;
    } else if (indexPath.row == 3) {
        isChecked = row3Item.checked;
    } else if (indexPath.row == 4) {
        isChecked = row4Item.checked;
    }
    
    if (isChecked) {
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
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CheckListItem"];
    
    UILabel *itemLabel = (UILabel *) [cell viewWithTag:(1000)];
    
    if (indexPath.row == 0){
        itemLabel.text = row1Item.name;
    }else if (indexPath.row == 1){
        itemLabel.text = row2Item.name;
    }else if (indexPath.row == 2){
        itemLabel.text = row3Item.name;
    }else if (indexPath.row == 3){
        itemLabel.text = row4Item.name;
    }else if (indexPath.row == 4){
        itemLabel.text = row0Item.name;
    }
        
    [self configureCheckMarkForCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone) {
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
