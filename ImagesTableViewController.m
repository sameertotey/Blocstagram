//
//  ImagesTableViewController.m
//  Blocstagram
//
//  Created by Sameer Totey on 10/13/14.
//  Copyright (c) 2014 Sameer Totey. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "DataSouce.h"
#import "User.h"
#import "Media.h"
#import "Comment.h"
#import "MediaTableViewCell.h"

@interface ImagesTableViewController ()

@end

@implementation ImagesTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[DataSouce sharedInstance] addObserver:self forKeyPath:@"mediaItems" options:0 context:nil];
    [self.tableView registerClass:[MediaTableViewCell class] forCellReuseIdentifier:@"mediaCell"];
}

- (void) dealloc {
    [[DataSouce sharedInstance] removeObserver:self forKeyPath:@"mediaItems"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == [DataSouce sharedInstance] && [keyPath isEqualToString:@"mediaItems"]) {
        // We know mediaItems changed, lets find out what kind of change it is
        int kindOfChange = [change[NSKeyValueChangeKindKey] intValue];
        
        if (kindOfChange == NSKeyValueChangeSetting) {
            // someone set a brand new images array
            [self.tableView reloadData];
        } else if (kindOfChange == NSKeyValueChangeInsertion ||
                   kindOfChange == NSKeyValueChangeRemoval ||
                   kindOfChange == NSKeyValueChangeReplacement) {
            // We have an incremental change, insertion, removal or replacement
            
            // Get a list of the index (or indexes) that changed
            NSIndexSet *indexSetOfChanges = change[NSKeyValueChangeIndexesKey];
            
            // Convert this NSIndexSet to NSArray of NSIndexPaths (which is what the tableView animation methods require)
            NSMutableArray *indexPathsThatChanged = [NSMutableArray array];
            [indexSetOfChanges enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:idx inSection:0];
                [indexPathsThatChanged addObject:newIndexPath];
            }];
            
            // Call beginUpdates to tell the tableview that we are about to make changes
            [self.tableView beginUpdates];
            
            // Tell the tableView what the changes are
            if (kindOfChange == NSKeyValueChangeInsertion) {
                [self.tableView insertRowsAtIndexPaths:indexPathsThatChanged withRowAnimation:UITableViewRowAnimationAutomatic];
            } else if (kindOfChange == NSKeyValueChangeRemoval) {
                [self.tableView deleteRowsAtIndexPaths:indexPathsThatChanged withRowAnimation:UITableViewRowAnimationAutomatic];
            } else if (kindOfChange == NSKeyValueChangeReplacement) {
                [self.tableView reloadRowsAtIndexPaths:indexPathsThatChanged withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            
            // Tell the tableView that we are done telling it about changes, and to complete the animation
            [self.tableView endUpdates];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self items].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mediaCell" forIndexPath:indexPath];
    
    cell.mediaItem = [self items][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Media *item = [self items][indexPath.row];
    return [MediaTableViewCell heightForMediaItem:item width:CGRectGetWidth(self.view.frame)];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[DataSouce sharedInstance] deleteMediaItem:[self items][indexPath.row]];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (NSArray *)items {
    return [DataSouce sharedInstance].mediaItems;
}

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
