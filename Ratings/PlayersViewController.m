//
//  PlayersViewController.m
//  Ratings
//
//  Created by Tasvir H Rohila on 22/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIImage *)imageForRating:(int)rating
{
    switch (rating)
    {
        case 1: return [UIImage imageNamed:@"1StarSmall.png"];
        case 2: return [UIImage imageNamed:@"2StarsSmall.png"];
        case 3: return [UIImage imageNamed:@"3StarsSmall.png"];
        case 4: return [UIImage imageNamed:@"4StarsSmall.png"];
        case 5: return [UIImage imageNamed:@"5StarsSmall.png"];
    }
    return nil;
}

#pragma -mark UITableview data sources
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _players.count;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCell *cell = (PlayerCell *)[tableView
                             dequeueReusableCellWithIdentifier:@"PlayerCell"];
    Player *player = [self.players objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    nameLabel.text = player.name;
    
    UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
    gameLabel.text = player.game;
    
    UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:102];
    ratingImageView.image = [self imageForRating:player.rating];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - delegate protocol methods
//Cancel
-(void) playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Done
/*
 This first adds the new Player object to the array of players. Then it tells the table view that a new row was added (at the bottom), because the table view and its data source must always be in sync. We could have just done a [self.tableView reloadData] but it looks nicer to insert the new row with an animation.
 */
-(void) PlayerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(Player *)player
{
    //Add object to Player model
    [self.players addObject:player];
    
    //Insert row into TableView
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.players.count -1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    //dismiss the Modal view
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"])
    {
        //Note that the destination of the segue is the Navigation Controller, because that is what we connected to the Bar Button Item. To get the PlayerDetailsViewController instance, we have to dig through the Navigation Controller’s viewControllers property to find it.
        UINavigationController *navigationController = segue.destinationViewController;
        PlayerDetailsViewController *playerDetailsViewController = [[navigationController viewControllers] objectAtIndex:0];
        
        //#IMP the Players screen has to tell the PlayerDetailsViewController that it is now its delegate.
        playerDetailsViewController.delegate = self;
    }    
}

@end
