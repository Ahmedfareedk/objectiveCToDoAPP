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
    
    _inProgressBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 4);
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addToInProgress:(id)sender {
    [_addTaskToInProgress passTaskIndexPath:_indexPath];
}

- (IBAction)addToDone:(id)sender {
}

@end
