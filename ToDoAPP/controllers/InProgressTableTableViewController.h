//
//  InProgressTableTableViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "OnAddToProgress.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgressTableTableViewController : UITableViewController <OnAddToProgress, UISearchBarDelegate>

@property NSMutableArray<NSDictionary*> *inprog;
@end

NS_ASSUME_NONNULL_END
