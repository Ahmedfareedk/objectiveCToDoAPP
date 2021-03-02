//
//  TaskProtocol.h
//  ToDoAPP
//
//  Created by AhmedFareed on 28/02/2021.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TaskProtocol <NSObject>


@required
-(void)OnAddTask:(Task*)task;
@end

NS_ASSUME_NONNULL_END
