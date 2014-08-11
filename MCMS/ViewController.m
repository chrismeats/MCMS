//
//  ViewController.m
//  MCMS
//
//  Created by ETC ComputerLand on 7/29/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *creaturesTableView;
@property (strong, nonatomic) IBOutlet UITextField *addCreatureTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    MagicalCreature *ironMan = [[MagicalCreature alloc] initWithName:@"Iron Man"];
    ironMan.description = @"Wears a suit made of iron";
    ironMan.image = [UIImage imageNamed:@"ironman"];
    MagicalCreature *thor = [[MagicalCreature alloc] initWithName:@"Thor"];
    thor.description = @"Wields a hammer";
    thor.image = [UIImage imageNamed:@"thor"];
    MagicalCreature *captainAmerica = [[MagicalCreature alloc] initWithName:@"Captain America"];
    captainAmerica.description = @"Uses a shield";
    captainAmerica.image = [UIImage imageNamed:@"captainAmerica"];

    self.creatures = [[NSMutableArray alloc] initWithObjects:
                      ironMan,
                      thor,
                      captainAmerica,
                      nil];

}
- (IBAction)onAddButtonClicked:(id)sender {
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.addCreatureTextField.text];
    [self.creatures addObject:creature];
    [self.addCreatureTextField resignFirstResponder];
    self.addCreatureTextField.text = nil;
    [self.creaturesTableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.creaturesTableView indexPathForSelectedRow];
    DetailViewController *dvc = [segue destinationViewController];
    MagicalCreature *magicalCreature = self.creatures[indexPath.row];
    dvc.title = magicalCreature.name;
    dvc.creature = magicalCreature;
    dvc.creaturesTableView = self.creaturesTableView;
}


@end
