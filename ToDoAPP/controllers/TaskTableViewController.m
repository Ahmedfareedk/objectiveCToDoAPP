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

@interface TaskTableViewController ()

@end

@implementation TaskTableViewController
{
    
    NSMutableArray<Task*> *tasks;
    NSMutableArray<NSDictionary*> *tasksDictArray;
    NSUserDefaults *taskPrefernces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    taskPrefernces = [NSUserDefaults standardUserDefaults];
    tasks = [[NSMutableArray alloc] init];
    
   if([taskPrefernces arrayForKey:@"taskDictPref"]){
        tasksDictArray = [[taskPrefernces objectForKey:@"taskDictPref"]mutableCopy];
    }else
    tasksDictArray = [NSMutableArray new];
    

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
    
    return taskCell;
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
    
    NSDictionary *taskDictionary = @{
        @"title" : task.taskTitle,
        @"desc" : task.taskDesc,
        @"date" : task.taskDate,
        @"periority" : task.taskPeriority
    };
    
    [tasksDictArray addObject:taskDictionary];
    
   [taskPrefernces setObject:tasksDictArray forKey:@"taskDictPref"];
   [taskPrefernces synchronize];
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



@end
