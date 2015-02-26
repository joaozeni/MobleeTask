//
//  TopicsTableViewController.m
//  StackOverflowIOSApp
//
//  Created by joao guilherme zeni on 24/02/15.
//  Copyright (c) 2015 joao guilherme zeni. All rights reserved.
//

#import "TopicsTableViewController.h"
#import "Topic.h"
#import "QuestionsTableViewController.h"

@interface TopicsTableViewController ()

@property NSMutableArray *topics; //Maybe change later to static
@property NSString *selectedSectionTitle; //To pass to next section

@end

@implementation TopicsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topics = [[NSMutableArray alloc] init];
    [self loadTopics];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadTopics {
    Topic *iphone = [[Topic alloc] init];
    iphone.topicTitle = @"Iphone";
    iphone.topicPicture = [UIImage imageWithContentsOfFile:@"iphone-sim-icon.png"];
    [self.topics addObject:iphone];
    
    Topic *cocoaTouch = [[Topic alloc] init];
    cocoaTouch.topicTitle = @"Cocoa Touch";
    cocoaTouch.topicPicture = [UIImage imageWithContentsOfFile:@"coredata.png"];
    [self.topics addObject:cocoaTouch];
    
    Topic *uikit = [[Topic alloc] init];
    uikit.topicTitle = @"UiKit";
    uikit.topicPicture = [UIImage imageWithContentsOfFile:@"uikit.png"];
    [self.topics addObject:uikit];
    
    Topic *objc = [[Topic alloc] init];
    objc.topicTitle = @"Objective-C";
    objc.topicPicture = [UIImage imageWithContentsOfFile:@"objc.png"];
    [self.topics addObject:objc];
    
    Topic *xcode = [[Topic alloc] init];
    xcode.topicTitle = @"Xcode";
    xcode.topicPicture = [UIImage imageWithContentsOfFile:@"xcode.png"];
    [self.topics addObject:xcode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.topics count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Topic *topic = [self.topics objectAtIndex:indexPath.row];
    cell.textLabel.text = topic.topicTitle;
    cell.imageView.image = topic.topicPicture;
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"SectionTitle"]){
        QuestionsTableViewController *questionsTableViewController = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        Topic *topic = [self.topics objectAtIndex:myIndexPath.row];
        questionsTableViewController.sectionName = topic.topicTitle;
    }
}

@end
