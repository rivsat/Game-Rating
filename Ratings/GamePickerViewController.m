//
//  GamePickerViewController.m
//  Ratings
//
//  Created by Tasvir H Rohila on 23/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import "GamePickerViewController.h"

@interface GamePickerViewController ()


@end

@implementation GamePickerViewController {
    NSArray *games;
    NSUInteger selectedIndex;
}

@synthesize game;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    games = [NSArray arrayWithObjects:
             @"Angry Birds",
             @"Chess",
             @"Crossword",
             @"Need For Speed",
             @"Nintendo",
             @"Mario",
             nil];
    
    //Here we figure out what the index is for that game in the list of games. We’ll use that index to set a checkmark in the table view cell.
    selectedIndex = [games indexOfObject:self.game];
    
}

-(void) viewDidUnload
{
    games = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    games = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return games.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell" forIndexPath:indexPath];
    cell.textLabel.text = [games objectAtIndex:indexPath.row];
    
    //This sets a checkmark on the cell that contains the name of the currently selected game.
    if (indexPath.row == selectedIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
    
}

#pragma mark - table view delegates
//#1 First we deselect the row after it was tapped. That makes it fade from the blue highlight color back to the regular white.
//#2 Then we remove the checkmark from the cell that was previously selected, and
//#3 put it on the row that was just tapped.
//#4 Finally, we return the name of the chosen game to the delegate.
/*
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //#1
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //#2
    if (selectedIndex != NSNotFound)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //#3
    selectedIndex = indexPath.row+1;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //#4
    NSString *theGame = [games objectAtIndex:indexPath.row];
    [self.delegate gamePickerViewController:self
                              didSelectGame:theGame];
}
*/
//#1 First we deselect the row after it was tapped. That makes it fade from the blue highlight color back to the regular white.
//#2 Then we remove the checkmark from the cell that was previously selected, and
//#3 put it on the row that was just tapped.
//#4 Finally, we return the name of the chosen game to the delegate.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (selectedIndex != NSNotFound)
    {
        //#1
        [tableView deselectRowAtIndexPath:[NSIndexPath indexPathWithIndex:selectedIndex] animated:YES];
        //#2
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //#3
    selectedIndex = indexPath.row;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //#4
    NSString *theGame = [games objectAtIndex:indexPath.row];
    [self.delegate gamePickerViewController:self
                              didSelectGame:theGame];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
