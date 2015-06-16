//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Yoseob Lee on 6/16/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()
@property (nonatomic, strong) FISLocation *location;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                      Latitude:@40.7484
                                                     Longitude:@-73.9857];
    
    FISTrivia *trivia1A = [[FISTrivia alloc] initWithContent:@"1,454 Feet Tall" Likes:4];
    FISTrivia *trivia1B = [[FISTrivia alloc] initWithContent:@"Cost $24,718,000 to build" Likes:2];
    
    [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];
    
    FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                      Latitude:@41.3739
                                                     Longitude:@-83.6508];
    
    FISTrivia *trivia2A = [[FISTrivia alloc] initWithContent:@"NYC's oldest park" Likes:8];
    FISTrivia *trivia2B = [[FISTrivia alloc] initWithContent:@"Made a park in 1733" Likes:2];
    FISTrivia *trivia2C = [[FISTrivia alloc] initWithContent:@"Charging Bull was created in 1989" Likes:0];
    
    
    [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];
    
    FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                      Latitude:@40.6892
                                                     Longitude:@74.0444];
    FISTrivia *trivia3A = [[FISTrivia alloc] initWithContent:@"Gift from the french" Likes:6];
    
    [location3.trivia addObjectsFromArray:@[trivia3A]];
    
    self.locations = [@[location1,location2,location3]mutableCopy];
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
     // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.locations count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    FISLocation *placeholderLocation = self.locations[section];
    return [placeholderLocation.trivia count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    FISLocation *placeholderLocation = self.locations[section];
    
    NSString *title = placeholderLocation.name;
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationReuseID" forIndexPath:indexPath];
    
    NSUInteger cellSection = indexPath.section;
    NSUInteger cellRow = indexPath.row;
    
    FISLocation *placeholderLocation = self.locations[cellSection];
    FISTrivia *triviaItems = placeholderLocation.trivia[cellRow];
    
    cell.textLabel.text = triviaItems.content;
    
    
//    NSNumber *triviaItems = [NSNumber numberWithInteger:placeholderLocation.trivia.count];
//    cell.detailTextLabel.text = [triviaItems stringValue];
    
    return cell;
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


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    FISLocation *locationToMove = self.locations[fromIndexPath.row];
    [self.locations removeObjectAtIndex:fromIndexPath.row];
    [self.locations insertObject:locationToMove atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    FISTriviaTableViewController *destinationController = segue.destinationViewController;
//    
//    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
//    NSUInteger selectedNumber = selectedIndexPath.row;
//    
//    FISLocation *placeholderLocation = self.locations[selectedNumber];
//    
//    destinationController.arrayOfTrivia = [NSMutableArray arrayWithArray:placeholderLocation.trivia];
//    
//}

@end
