//
//  AlertsUtilViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import "AlertsUtilViewController.h"

@interface AlertsUtilViewController ()

@end

@implementation AlertsUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)showToast:(NSString *)message viewController :(UIViewController*)viewController {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];

    [viewController presentViewController:alert animated:YES completion:nil];

    int duration = 1; // duration in seconds

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
