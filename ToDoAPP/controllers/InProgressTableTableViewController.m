//
//  InProgressTableTableViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import "InProgressTableTableViewController.h"
#import "TaskTableViewCell.h"
#import "ColorUtilViewController.h"
#import "AlertsUtilViewController.h"
#import "ContentEditViewController.h"


@interface InProgressTableTableViewController ()

@end

@implementation InProgressTableTableViewController
{
  
    NSUserDefaults *inProgPreferences;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    printf("\nDid Load");
   
    inProgPreferences = [NSUserDefaults standardUserDefaults];
    
    
   if([inProgPreferences arrayForKey:@"inProgTasks"]){
        _inprog = [[inProgPreferences objectForKey:@"inProgTasks"]mutableCopy];
    }else
        _inprog = [NSMutableArray new];
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveModel:) name:@"sharingTheModel" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
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

    
    
    cell.progressTitle.text = [[_inprog objectAtIndex:indexPath.row]objectForKey:@"title"];
    cell.progressDesc.text = [[_inprog objectAtIndex:indexPath.row]objectForKey:@"desc"];
    cell.progressDate.text = [[_inprog objectAtIndex:indexPath.row]objectForKey:@"date"];
   
    
    [cell setPassTask:self];
    [cell setIndexPath:indexPath];
    
    
    NSString *periorityValue =[[_inprog objectAtIndex:indexPath.row]objectForKey:@"periority"] ;
    
    [ColorUtilViewController setCellColor:periorityValue cell:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContentEditViewController *editTaskController = [self.storyboard instantiateViewControllerWithIdentifier:@"edit_view"];
    
    [editTaskController setTaskDict:[self->_inprog objectAtIndex:indexPath.row]];
    
    [editTaskController setIndexPath:indexPath];
    [editTaskController setPassTaskDict:self];
    
    [self.navigationController presentViewController:editTaskController animated:YES completion:nil];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}

-(void)passTaskIndexPath:(NSIndexPath *)indexPath{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addToDone" object:nil userInfo:[_inprog objectAtIndex:indexPath.row]];
    
    [_inprog removeObjectAtIndex:indexPath.row];
    
    [inProgPreferences setObject:_inprog forKey:@"inProgTasks"];
    [inProgPreferences synchronize];
    [self.tableView reloadData];

    [AlertsUtilViewController showToast:@"Added To in Done" viewController:self];
}


-(void) recieveModel:(NSNotification*)notification{
    
    NSDictionary *taskDict = notification.userInfo;
        NSDictionary *keyValueDict = @{
            @"title": [taskDict objectForKey:@"title"]
            ,@"desc": [taskDict objectForKey:@"desc"]
            ,@"date":[taskDict objectForKey:@"date"]
            ,@"periority" : [taskDict objectForKey:@"periority"]
        };
        
    [_inprog addObject:keyValueDict];
        [inProgPreferences setObject:_inprog forKey:@"inProgTasks"];
        [inProgPreferences synchronize];
    
}

- (void)onAddTaskDict:(NSDictionary *)taskDict indexPath:(NSIndexPath *)indexPath{
    
    [_inprog replaceObjectAtIndex:indexPath.row withObject:taskDict];
    [inProgPreferences setObject:_inprog forKey:@"inProgTasks"];
    [inProgPreferences synchronize];
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
