//
//  ContentEditViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 03/03/2021.
//

#import "ContentEditViewController.h"
#import "Task.h"

@interface ContentEditViewController ()

@end

@implementation ContentEditViewController{
    NSArray *periorities;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    periorities = @[@"High", @"Medium", @"Low"];
    [self.editTaskPeriorityPicker selectRow:1 inComponent:0 animated:YES];
    _periorityValue = @"Medium";
    
    [self showHideComp:NO];
    [self fillLables];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(visibleEditors)];
    [self.view addGestureRecognizer:gesture];
}

-(void)visibleEditors{
    [self showHideComp:YES];
 
}

-(void)showHideComp :(BOOL)isShow{
    if(isShow){
        [_editTaskTitle setHidden:NO];
        [_editTaskDesc setHidden:NO];
        [_editTaskPeriorityPicker setHidden:NO];
        [_editTaskTitleLabel setHidden:YES];
        [_editTaskDescLabel setHidden:YES];
        [_editTaskPeriorityLabel setHidden:YES];
        [_taskTitleBase setHidden:YES];
        [_taskDescBase setHidden:YES];
    }else{
        [_editTaskTitle setHidden:YES];
        [_editTaskDesc setHidden:YES];
        [_editTaskPeriorityPicker setHidden:YES];
        [_editTaskTitleLabel setHidden:NO];
        [_editTaskDescLabel setHidden:NO];
        [_editTaskPeriorityLabel setHidden:NO];
        [_taskTitleBase setHidden:NO];
        [_taskDescBase setHidden:NO];
    }
}



-(void)fillLables{

_editTaskTitleLabel.text = [_taskDict objectForKey:@"title"];
_editTaskDescLabel.text = [_taskDict objectForKey:@"desc"];
_editTaskPeriorityLabel.text = [_taskDict objectForKey:@"periority"];
_editTaskDateLabel.text = [_taskDict objectForKey:@"date"];


_editTaskTitle.text = [_taskDict objectForKey:@"title"];
_editTaskDesc.text = [_taskDict objectForKey:@"desc"];

}




- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return periorities.count;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return periorities[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _periorityValue = periorities[row];
}

- (IBAction)doneEdit:(id)sender  {
//    NSDictionary *editedTask = @{
//        @"title" : [_taskDict objectForKey:@"title"]
//        ,@"desc" : [_taskDict objectForKey:@"desc"]
//        ,@"periority" : [_taskDict objectForKey:@"periority"]
//        ,@"dare" : [_taskDict objectForKey:@"date"]
//    };
    
    NSDictionary *editedTask = @{
        @"title" : _editTaskTitle.text
        ,@"desc" : _editTaskDesc.text
        ,@"periority" :_periorityValue
        ,@"date" : _editTaskDateLabel.text
       
    };
//    [_taskDict setValue:_editTaskTitle.text forKey:@"title"];
//    [_taskDict setValue:_editTaskDesc.text forKey:@"desc"];
//    [_taskDict setValue:_editTaskDate.text forKey:@"date"];
//    [_taskDict setValue:_periorityValue forKey:@"periority"];
    
    [_passTaskDict onAddTaskDict:editedTask indexPath:_indexPath];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
