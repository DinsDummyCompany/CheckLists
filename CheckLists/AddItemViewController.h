//
//  AddItemViewController.h
//  CheckLists
//
//  Created by Jonathan Carnie on 29/08/12.
//  Copyright (c) 2012 Jonathan Carnie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

-(IBAction)cancel;

-(IBAction)done;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@end
