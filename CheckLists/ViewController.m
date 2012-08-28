//
//  ViewController.m
//  CheckLists
//
//  Created by Jonathan Carnie on 28/08/12.
//  Copyright (c) 2012 Jonathan Carnie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
        itemLabel.text = @"Walk the dog";
    }else if (indexPath.row == 1){
        itemLabel.text = @"Wash the Car";
    }else if (indexPath.row == 2){
        itemLabel.text = @"Put out the clothes";
    }else if (indexPath.row == 3){
        itemLabel.text = @"Brush my Teeth";
    }else if (indexPath.row == 4){
        itemLabel.text = @"Play games";
    }
        
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
