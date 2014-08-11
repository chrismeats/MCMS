//
//  DetailViewController.h
//  MCMS
//
//  Created by ETC ComputerLand on 7/29/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface DetailViewController : ViewController
@property MagicalCreature *creature;
@property UITableView *creaturesTableView;

@end
