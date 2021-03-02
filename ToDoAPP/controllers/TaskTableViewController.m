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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tasks = [[NSMutableArray alloc] init];

    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    [self.navigationItem setRightBarButtonItem:addBtn];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TaskTableViewCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"task" forIndexPath:indexPath];
    taskCell.inProgressBtn.layer.cornerRadius = 8.0;
   
    [taskCell setAddTaskToInProgress:self];
    [taskCell setIndexPath:indexPath];
    
    taskCell.taskTitle.text = [[tasks objectAtIndex:indexPath.row]taskTitle];
    taskCell.taskDescription.text = [[tasks objectAtIndex:indexPath.row]taskDesc];
    taskCell.taskDate.text = [[tasks objectAtIndex:indexPath.row]taskDate];
    
    NSString *periorityValue =[[tasks objectAtIndex:indexPath.row]taskPeriority] ;
    
    if([periorityValue isEqual:@"High"]){
        taskCell.backgroundColor = [ColorUtilViewController highColor];
        
    }else if ([periorityValue isEqual:@"Medium"]){
        taskCell.backgroundColor = [ColorUtilViewController mediumColor];
        
    }else{
        taskCell.backgroundColor = [ColorUtilViewController lowColor];
    }
    
    return taskCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return tasks.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (void)OnAddTask:(Task *)task{
    [tasks addObject:task];
}

-(void) add{
    
    TaskContentViewController *taskContentView; = [self.storyboard instantiateViewControllerWithIdentifier:@"task_content"];
    
    [taskContentView setOnTaskDone:self];
    
    [self.navigationController pushViewController:taskContentView animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    printf("\nWill appear");
    [_tableView reloadData];
}

//Implement The Add to progress Protocol Methods
- (void)passTaskIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *taskDict = [NSDictionary dictionaryWithObject:[tasks objectAtIndex:indexPath.row] forKey:@"task"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sharingTheModel" object:nil userInfo:taskDict];
    [tasks removeObject:[tasks objectAtIndex:indexPath.row]];
    [_tableView reloadData];

    [AlertsUtilViewController showToast:@"Added To in Progress" viewController:self];
}



@end
