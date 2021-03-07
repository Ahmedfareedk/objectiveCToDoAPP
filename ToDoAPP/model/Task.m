//
//  Task.m
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import "Task.h"

@implementation Task

-(id)initWithAttributes :(NSString*)title description :(NSString*) description periority :(NSString*) periority date :(NSString*) date deadline :(NSDate*) deadline  remindMe :(BOOL)remindMe{
    
    self = [super init];
    if (self) {
        self.taskTitle = title;
        self.taskDesc = description;
        self.taskPeriority = periority;
        self.taskDate = date;
        self.deadline = deadline;
        self.remindMe =remindMe;
    }

    return self;
}

@end
