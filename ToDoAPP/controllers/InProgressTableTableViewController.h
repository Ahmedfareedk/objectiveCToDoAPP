//
//  InProgressTableTableViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import <UIKit/UIKit.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgressTableTableViewController : UITableViewController

@property Task *task;
@property NSMutableArray<Task*> *inprog;
@end

NS_ASSUME_NONNULL_END
