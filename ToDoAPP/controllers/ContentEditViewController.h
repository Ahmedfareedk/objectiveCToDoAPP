//
//  ContentEditViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 03/03/2021.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentEditViewController : UIViewController  <UIPickerViewDelegate, UIPickerViewDataSource>
@property id <TaskProtocol> passTaskDict;


@property (weak, nonatomic) IBOutlet UITextField *editTaskTitle;
@property (weak, nonatomic) IBOutlet UITextField *editTaskDesc;
@property (weak, nonatomic) IBOutlet UIPickerView *editTaskPeriorityPicker;
@property (weak, nonatomic) IBOutlet UILabel *editTaskTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *editTaskDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *editTaskPeriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *editTaskDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *taskTitleBase;
@property (weak, nonatomic) IBOutlet UILabel *taskDescBase;

@property NSDictionary *taskDict;
@property NSString* periorityValue;
@property NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
