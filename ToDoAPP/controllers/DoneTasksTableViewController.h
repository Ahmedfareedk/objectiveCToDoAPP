//
//  DoneTasksTableViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 03/03/2021.
//

#import <UIKit/UIKit.h>
#import "onAddToProgress.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoneTasksTableViewController : UITableViewController<OnAddToProgress, UISearchBarDelegate>

@end

NS_ASSUME_NONNULL_END
