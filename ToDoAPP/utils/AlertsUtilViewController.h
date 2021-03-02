//
//  AlertsUtilViewController.h
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertsUtilViewController : UIViewController

+ (void)showToast:(NSString *)message viewController :(UIViewController*)viewController;
@end

NS_ASSUME_NONNULL_END
