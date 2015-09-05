//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by Tasvir H Rohila on 23/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"

@interface PlayerDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation PlayerDetailsViewController
{
    //We use this ivar to remember the selected game so we can store it in the Player object later.
    NSString *game;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    //We should give it a default value. The initWithCoder method is a good place for that.
    if ((self = [super initWithCoder:aDecoder]))
    {
        NSLog(@"initWithCoder PlayerDetailsViewController");
        game = @"Angry Birds";
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailLabel.text = game;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark Navigation item actions
- (IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    Player *player = [[Player alloc] init];
    player.name = self.nameTextField.text;
    player.game = game; //as received from GamePicker
    player.rating = 1;
    [self.delegate PlayerDetailsViewController:self didAddPlayer:player];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        [self.nameTextField becomeFirstResponder];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"])
    {
        // Get the new view controller using [segue destinationViewController].
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        // Pass the selected object to the new view controller.
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = game;
    }

}

#pragma mark - GamePickerViewControllerDelegate

- (void)gamePickerViewController:(GamePickerViewController *)controller
                   didSelectGame:(NSString *)theGame
{
    game = theGame;
    self.detailLabel.text = game;
    
    //remove the pushed viewController from the navigationstack
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 When you use static cells, your table view controller doesn’t need a data source. Because we used an Xcode template to create our PlayerDetailsViewController class, it still has some placeholder code for the data source, so let’s remove that code now that we have no use for it. Delete anything between the:
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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




@end
