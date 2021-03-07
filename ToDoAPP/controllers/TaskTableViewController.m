//
//  TaskTableViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import "TaskTableViewController.h"
#import "TaskTableViewCell.h"
#import "Task.h"
#import "TaskContentViewController.h"
#import "InProgressTableTableViewController.h"
#import "ColorUtilViewController.h"
#import "AlertsUtilViewController.h"
#import "ContentEditViewController.h"

@interface TaskTableViewController ()

@end

@implementation TaskTableViewController
{
    

    NSMutableArray<NSDictionary*> *filteredTasks;
    NSMutableArray<NSDictionary*> *tasksDictArray;
    NSUserDefaults *taskPrefernces;
    NSDate *deadlineDate;
    BOOL isGranted;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    taskPrefernces = [NSUserDefaults standardUserDefaults];
    
    
    isGranted = false;
  
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        self->isGranted = granted;
    }];
    
    filteredTasks = [[NSMutableArray alloc]initWithArray:tasksDictArray];
    
   if([taskPrefernces arrayForKey:@"taskDictPref"]){
        tasksDictArray = [[taskPrefernces objectForKey:@"taskDictPref"]mutableCopy];
    }else
    tasksDictArray = [NSMutableArray new];
    
    filteredTasks = [taskPrefernces objectForKey:@"taskDictPref"];

    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    [self.navigationItem setRightBarButtonItem:addBtn];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TaskTableViewCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"task" forIndexPath:indexPath];
    taskCell.inProgressBtn.layer.cornerRadius = 8.0;
   
    [taskCell setPassTask:self];
    [taskCell setIndexPath:indexPath];

    
    taskCell.taskTitle.text = [[tasksDictArray objectAtIndex:indexPath.row]objectForKey:@"title"];
    taskCell.taskDescription.text = [[tasksDictArray objectAtIndex:indexPath.row]objectForKey:@"desc"];
    
    taskCell.taskDate.text = [[tasksDictArray objectAtIndex:indexPath.row]objectForKey:@"date"];

    NSString *periorityValue =[[tasksDictArray objectAtIndex:indexPath.row]objectForKey:@"periority"];
        [ColorUtilViewController setCellColor:periorityValue cell:taskCell];
    
    if([[tasksDictArray objectAtIndex:indexPath.row]objectForKey:@"remind_me"]){
        [taskCell.alarmImg setHidden:NO];
    }
        
   
    
    return taskCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContentEditViewController *editTaskController = [self.storyboard instantiateViewControllerWithIdentifier:@"edit_view"];
    
    [editTaskController setTaskDict:[self->tasksDictArray objectAtIndex:indexPath.row]];
    
    [editTaskController setIndexPath:indexPath];
    [editTaskController setPassTaskDict:self];
    
    [self.navigationController presentViewController:editTaskController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [tasksDictArray count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (void)OnAddTask:(Task *)task{
    
    deadlineDate = task.deadline;
    
    NSDictionary *taskDictionary = @{
        @"title" : task.taskTitle,
        @"desc" : task.taskDesc,
        @"date" : task.taskDate,
        @"periority" : task.taskPeriority,
        @"deadline": task.deadline,
        @"remind_me": @(task.remindMe)
    };
    
    [tasksDictArray addObject:taskDictionary];
    
    if ([taskDictionary valueForKey:@"remind_me"]) {
        [self requestNotification:task.taskTitle desription:task.taskDesc];
        
    }
 
   [taskPrefernces setObject:tasksDictArray forKey:@"taskDictPref"];
   [taskPrefernces synchronize];
    filteredTasks = [taskPrefernces objectForKey:@"taskDictPref"];
}

-(void) add{
    
    TaskContentViewController *taskContentView = [self.storyboard instantiateViewControllerWithIdentifier:@"task_content"];
    
    [taskContentView setOnTaskDone:self];
    
    [self.navigationController pushViewController:taskContentView animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [_tableView reloadData];
}

//Implement The Add to progress Protocol Methods
- (void)passTaskIndexPath:(NSIndexPath *)indexPath{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sharingTheModel" object:nil userInfo:[tasksDictArray objectAtIndex:indexPath.row]];
    
    [tasksDictArray removeObjectAtIndex:indexPath.row];
    

    [taskPrefernces setObject:tasksDictArray forKey:@"taskDictPref"];
    [taskPrefernces synchronize];
    [_tableView reloadData];

    [AlertsUtilViewController showToast:@"Added To in Progress" viewController:self];
}



- (void)onAddTaskDict:(NSDictionary *)taskDict indexPath:(NSIndexPath *)indexPath{
   
    [tasksDictArray replaceObjectAtIndex:indexPath.row withObject:taskDict];
    [taskPrefernces setObject:tasksDictArray forKey:@"taskDictPref"];
    [taskPrefernces synchronize];
    [_tableView reloadData];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(searchText.length == 0)
    {
        [tasksDictArray removeAllObjects];
        [tasksDictArray addObjectsFromArray:filteredTasks];
    }else{
        [tasksDictArray removeAllObjects];
        for(NSDictionary *query in filteredTasks){
            NSString *stringQuery = [query objectForKey:@"title"];
            
            NSRange searchRange = [stringQuery rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(searchRange.location != NSNotFound){
                [tasksDictArray addObject:query];
            }
          
        }
    }

    [_tableView reloadData];
}

-(void)requestNotification:(NSString*)title  desription :(NSString*) description{
    if(isGranted){
    UNUserNotificationCenter *notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc]init];
    
    content.title = [NSString stringWithFormat:@"%@ Task Deadline!",title];
    content.body = description;
    
    content.sound = [UNNotificationSound defaultSound];
        
        NSDateComponents *detailedDate = [[NSCalendar currentCalendar]
                             components:NSCalendarUnitYear +
                             NSCalendarUnitMonth + NSCalendarUnitDay +
                             NSCalendarUnitHour + NSCalendarUnitMinute +
                             NSCalendarUnitSecond fromDate:deadlineDate];
    
    
        UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:detailedDate repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:title content:content trigger:trigger];
    
    [notificationCenter addNotificationRequest:request withCompletionHandler:nil];
   }
}
@end
