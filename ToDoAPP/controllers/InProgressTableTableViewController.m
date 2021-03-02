//
//  InProgressTableTableViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import "InProgressTableTableViewController.h"
#import "TaskTableViewCell.h"
#import "ColorUtilViewController.h"


@interface InProgressTableTableViewController ()

@end

@implementation InProgressTableTableViewController
{
  
    NSDictionary *taskDict;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    printf("\nDid Load");
    _inprog = [NSMutableArray new];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveModel:) name:@"sharingTheModel" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    printf("\nWill Appear   ");
   
    //NSLog(@"%lu", (unsigned long)delegate.inProgressTasksShared.count);
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    printf("\ndid Appear  ");
    NSLog(@"%ld", (long)_inprog.count);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return todo.inProgressTasks.count;
    return _inprog.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"progress" forIndexPath:indexPath];

    cell.progressTitle.text = [[_inprog objectAtIndex:indexPath.row]taskTitle];
    cell.progressDesc.text = [[_inprog objectAtIndex:indexPath.row]taskDesc];
    cell.progressDate.text = [[_inprog objectAtIndex:indexPath.row]taskDate];
    
    NSString *periorityValue =[[_inprog objectAtIndex:indexPath.row]taskPeriority] ;
    
    if([periorityValue isEqual:@"High"]){
        cell.backgroundColor = [ColorUtilViewController highColor];
        
    }else if ([periorityValue isEqual:@"Medium"]){
        cell.backgroundColor = [ColorUtilViewController mediumColor];
        
    }else{
        cell.backgroundColor = [ColorUtilViewController lowColor];
    }
    
    return cell;
}

-(void) recieveModel:(NSNotification*)notification{
    if(notification.userInfo != NULL){
    taskDict = notification.userInfo;
    [_inprog addObject:[taskDict objectForKey:@"task"]];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
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
