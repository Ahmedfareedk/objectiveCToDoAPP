//
//  Task.m
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import "Task.h"

@implementation Task

-(id)initWithAttributes :(NSString*)title description :(NSString*) description periority :(NSString*) periority date :(NSString*) date{
    
    self = [super init];
    if (self) {
        self.taskTitle = title;
        self.taskDesc = description;
        self.taskPeriority = periority;
        self.taskDate = date;
    }

    return self;
}

@end
