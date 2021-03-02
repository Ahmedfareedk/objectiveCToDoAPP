//
//  UtilsViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorUtilViewController : UIViewController

+(UIColor*)highColor;
+(UIColor*)mediumColor;
+(UIColor*)lowColor;
+(void)setCellColor:(NSString*)periorityValue cell :(UITableViewCell*)cell;

@end

NS_ASSUME_NONNULL_END
