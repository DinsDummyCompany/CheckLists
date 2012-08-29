//
//  CheckListItem.m
//  CheckLists
//
//  Created by Jonathan Carnie on 28/08/12.
//  Copyright (c) 2012 Jonathan Carnie. All rights reserved.
//

#import "CheckListItem.h"

@implementation CheckListItem

@synthesize name, checked;


-(void)toggleChecked
{
    self.checked = !self.checked;
}

@end
