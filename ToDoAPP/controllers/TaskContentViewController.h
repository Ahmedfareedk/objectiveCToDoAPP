//
//  TaskContentViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import <UIKit/UIKit.h>
#import "TaskProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface TaskContentViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property id <TaskProtocol>onTaskDone;

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITextField *taskDesc;
@property (weak, nonatomic) IBOutlet UIPickerView *periorityPicker;
@property(weak, nonatomic)NSString *periorityValue;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end

NS_ASSUME_NONNULL_END
