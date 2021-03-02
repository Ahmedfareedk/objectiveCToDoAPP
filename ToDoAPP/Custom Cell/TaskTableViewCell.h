//
//  TaskTableViewCell.h
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import <UIKit/UIKit.h>
#import "OnAddToProgress.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *inProgressBtn;
@property id <OnAddToProgress> passTask;
@property NSIndexPath* indexPath;


@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskDescription;
@property (weak, nonatomic) IBOutlet UILabel *taskDate;


//in progress components
@property (weak, nonatomic) IBOutlet UILabel *progressTitle;
@property (weak, nonatomic) IBOutlet UILabel *progressDesc;
@property (weak, nonatomic) IBOutlet UILabel *progressDate;
@property (weak, nonatomic) IBOutlet UIButton *addToDoneBtn;


//Done Tasks Components
@property (weak, nonatomic) IBOutlet UILabel *doneTaskTitle;
@property (weak, nonatomic) IBOutlet UILabel *doneTaskDesc;
@property (weak, nonatomic) IBOutlet UILabel *doneTaskDate;

@end

NS_ASSUME_NONNULL_END
