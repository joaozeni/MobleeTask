//
//  QuestionsTableViewController.m
//  StackOverflowIOSApp
//
//  Created by joao guilherme zeni on 24/02/15.
//  Copyright (c) 2015 joao guilherme zeni. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "Question.h"

@interface QuestionsTableViewController ()

@property NSMutableArray *questions;

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questions = [[NSMutableArray alloc] init];
    [self loadTestData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTestData {
    Question *question1 = [[Question alloc] init];
    question1.questionTitle = @"I have a doubt";
    question1.questionScore = @50;
    question1.userName = @"I";
    question1.userPicture = [UIImage imageWithContentsOfFile:@"user.png"];
    [self.questions addObject:question1];
    
//    Question *question2 = [[Question alloc] init];
//    question2.questionTitle = self.sectionName ;
//    question2.questionScore = @50;
//    question2.userName = @"Myself";
//    question2.userPicture = [UIImage imageWithContentsOfFile:@"user.png"];
//    [self.questions addObject:question2];
}

#pragma mark - Table view data source

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return self.sectionName;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //Change to 20 later
    return [self.questions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Question *question = [self.questions objectAtIndex:indexPath.row]; //Load the data of the array for test
    
    UIImageView *img;
    UILabel *label;
    
    img = (UIImageView *)[cell viewWithTag:0]; //User Picture
    img.image = question.userPicture;
    
    
    label = (UILabel *)[cell viewWithTag:1]; //Username
    label.text = question.userName;
    
    label = (UILabel *)[cell viewWithTag:2]; //Title
    label.text = question.questionTitle;
    
    label = (UILabel *)[cell viewWithTag:3]; //Score
    label.text = [NSString stringWithFormat:@"%@", question.questionScore];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
