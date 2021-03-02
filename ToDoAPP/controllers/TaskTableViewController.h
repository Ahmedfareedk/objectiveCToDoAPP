//
//  TaskTableViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskProtocol.h"
#import "onAddToProgress.h"

NS_ASSUME_NONNULL_BEGIN


@interface TaskTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, TaskProtocol, OnAddToProgress>{
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
