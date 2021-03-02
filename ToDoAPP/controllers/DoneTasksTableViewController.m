//
//  DoneTasksTableViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 03/03/2021.
//

#import "DoneTasksTableViewController.h"
#import "Task.h"
#import "TaskTableViewCell.h"
#import "ColorUtilViewController.h"
@interface DoneTasksTableViewController ()

@end

@implementation DoneTasksTableViewController
{
    NSMutableArray<Task*> *doneTasks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    doneTasks = [NSMutableArray new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveDoneTasks:) name:@"addToDone" object:nil];
    
    
}

-(void) recieveDoneTasks : (NSNotification*)notification{
    if(notification.userInfo != NULL)
    {
        NSDictionary* taskDict = notification.userInfo;
        [doneTasks addObject:[taskDict objectForKey:@"done_task"]];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return doneTasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"done" forIndexPath:indexPath];
    
   cell.doneTaskTitle.text =[[doneTasks objectAtIndex:indexPath.row]taskTitle];
    cell.doneTaskDesc.text =[[doneTasks objectAtIndex:indexPath.row]taskDesc];
    cell.doneTaskDate.text =[[doneTasks objectAtIndex:indexPath.row]taskDate];

    NSString *periorityValue =[[doneTasks objectAtIndex:indexPath.row]taskPeriority];
    
    
    [ColorUtilViewController setCellColor:periorityValue cell:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"done size %ld", (long)doneTasks.count);
    
    [self.tableView reloadData];
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
