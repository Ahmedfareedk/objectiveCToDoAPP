//
//  onAddToProgress.h
//  ToDoAPP
//
//  Created by AhmedFareed on 01/03/2021.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OnAddToProgress <NSObject>

@required
-(void)passTaskIndexPath:(NSIndexPath*)indexPath;

@end

NS_ASSUME_NONNULL_END
