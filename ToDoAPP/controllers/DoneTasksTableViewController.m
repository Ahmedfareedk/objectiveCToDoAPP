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
    NSMutableArray<NSDictionary*> *doneTasks;
    NSUserDefaults *doneTaskPreferences;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    doneTaskPreferences = [NSUserDefaults standardUserDefaults];
    
    if([doneTaskPreferences arrayForKey:@"doneTasksPref"]){
        doneTasks = [[doneTaskPreferences objectForKey:@"doneTasksPref"]mutableCopy];
    }else
    doneTasks = [NSMutableArray new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveDoneTasks:) name:@"addToDone" object:nil];
    
    
}

-(void) recieveDoneTasks : (NSNotification*)notification{
 
     NSDictionary* taskDict = notification.userInfo;
    NSDictionary *keyValueDoneTasks = @{
        @"title" : [taskDict objectForKey:@"title"]
        ,@"desc" : [taskDict objectForKey:@"desc"]
        ,@"date" : [taskDict objectForKey:@"date"]
        ,@"periority" : [taskDict objectForKey:@"periority"]
    };
     [doneTasks addObject:keyValueDoneTasks];
    [doneTaskPreferences setObject:doneTasks forKey:@"doneTasksPref"];
    [doneTaskPreferences synchronize];
    
    
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
    
    cell.doneTaskTitle.text = [[doneTasks objectAtIndex:indexPath.row]objectForKey:@"title"];
    cell.doneTaskDesc.text = [[doneTasks objectAtIndex:indexPath.row]objectForKey:@"desc"];
    cell.doneTaskDate.text = [[doneTasks objectAtIndex:indexPath.row]objectForKey:@"date"];
    
    NSString *periorityValue =[[doneTasks objectAtIndex:indexPath.row]objectForKey:@"periority"] ;
    
    [ColorUtilViewController setCellColor:periorityValue cell:cell];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [doneTasks removeObjectAtIndex:indexPath.row];
        [doneTaskPreferences setObject:doneTasks forKey:@"doneTasksPref"];
        [doneTaskPreferences synchronize];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
       
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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
