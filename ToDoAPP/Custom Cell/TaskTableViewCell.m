//
//  TaskTableViewCell.m
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import "TaskTableViewCell.h"

@implementation TaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_alarmImg setHidden:YES];
    _inProgressBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 4);
    _addToDoneBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 4);
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addToInProgress:(id)sender {
    [_passTask passTaskIndexPath:_indexPath];
}

- (IBAction)addToDone:(id)sender {
    [_passTask passTaskIndexPath:_indexPath];
}

@end
