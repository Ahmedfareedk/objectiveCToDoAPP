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
@property id <OnAddToProgress> addTaskToInProgress;
@property NSIndexPath* indexPath;


@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskDescription;
@property (weak, nonatomic) IBOutlet UILabel *taskDate;


//in progress components
@property (weak, nonatomic) IBOutlet UILabel *progressTitle;
@property (weak, nonatomic) IBOutlet UILabel *progressDesc;
@property (weak, nonatomic) IBOutlet UILabel *progressDate;
@property (weak, nonatomic) IBOutlet UIButton *addToDoneBtn;

@end

NS_ASSUME_NONNULL_END
