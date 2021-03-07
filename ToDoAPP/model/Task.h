//
//  Task.h
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject
@property(nonatomic) NSString *taskTitle;
@property(nonatomic) NSString *taskDesc;
@property(nonatomic) NSString *taskPeriority;
@property(nonatomic) NSString *taskDate;
@property(weak,nonatomic)NSDate *deadline;
@property(nonatomic)BOOL remindMe;

-(id)initWithAttributes :(NSString*)title description :(NSString*) description periority :(NSString*) periority date :(NSString*) date deadline :(NSDate*) deadline  remindMe :(BOOL)remindMe;


@end

NS_ASSUME_NONNULL_END
