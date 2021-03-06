//
//  TaskContentViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import "TaskContentViewController.h"
#import "Task.h"

@interface TaskContentViewController ()

@end

@implementation TaskContentViewController

{
    NSArray *periorities;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    periorities = @[@"High", @"Medium", @"Low"];
    
    _date.text = [self currentDate];
    [self.periorityPicker selectRow:1 inComponent:0 animated:YES];
    _periorityValue = @"Medium";

    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    [self.navigationItem setRightBarButtonItem:done];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return periorities.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return periorities[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _periorityValue = periorities[row];
}


-(void)done{
    if([_taskTitle hasText] && [_taskDesc hasText]){
    Task *task = [[Task alloc]initWithAttributes:_taskTitle.text description:_taskDesc.text periority:_periorityValue date:_date.text];
        
        [_onTaskDone OnAddTask:task];
    [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        [self showToast];
    }
}




-(NSString*)currentDate{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM-dd-yyyy"];
    return [dateFormat stringFromDate:today];
}

-(void)showToast{

UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"All Feilds must be filled!" preferredStyle:UIAlertControllerStyleAlert];

[self presentViewController:alert animated:YES completion:nil];

int duration = 1; // duration in seconds

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [alert dismissViewControllerAnimated:YES completion:nil];
});
}
@end
