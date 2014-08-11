//
//  DetailViewController.m
//  MCMS
//
//  Created by ETC ComputerLand on 7/29/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UITextView *detailTextView;
@property (strong, nonatomic) IBOutlet UITextField *editDetailTextLabel;
@property (strong, nonatomic) IBOutlet UITextField *editNameTextLabel;
@property (strong, nonatomic) IBOutlet UITextView *nameDetailTextView;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailTextView.text = self.creature.description;
    self.nameDetailTextView.text = self.creature.name;

    self.editDetailTextLabel.hidden = YES;
    self.editNameTextLabel.hidden = YES;

    self.creatureImageView.image = self.creature.image;
}

- (IBAction)onEditButton:(id)sender {
    if (self.editing) {
        self.editing = NO;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.editDetailTextLabel.hidden = YES;
        self.detailTextView.hidden = NO;

        self.editNameTextLabel.hidden = YES;
        self.nameDetailTextView.hidden = NO;

        self.creature.name = self.editNameTextLabel.text;
        self.nameDetailTextView.text = self.editNameTextLabel.text;

        self.detailTextView.text = self.editDetailTextLabel.text;
        self.creature.description = self.editDetailTextLabel.text;

        [self.creaturesTableView reloadData];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editing = YES;
        self.editDetailTextLabel.hidden = NO;
        self.detailTextView.hidden = YES;

        self.editNameTextLabel.hidden = NO;
        self.nameDetailTextView.hidden = YES;

        self.editDetailTextLabel.text = self.detailTextView.text;
        self.editNameTextLabel.text = self.nameDetailTextView.text;
    }

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
