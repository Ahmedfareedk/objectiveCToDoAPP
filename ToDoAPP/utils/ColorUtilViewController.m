//
//  UtilsViewController.m
//  ToDoAPP
//
//  Created by AhmedFareed on 02/03/2021.
//

#import "ColorUtilViewController.h"

@interface ColorUtilViewController ()

@end

@implementation ColorUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



+(UIColor*)highColor{
    
    return  [UIColor colorWithRed:0xC7/255.0f
                            green:0x00/255.0f
                             blue:0x39/255.0f alpha:1];
}

+(UIColor*)mediumColor{
    
    return  [UIColor colorWithRed:0x21/255.0f
                            green:0x61/255.0f
                             blue:0x8c/255.0f alpha:1];
}

+(UIColor*)lowColor{
    
    return [UIColor colorWithRed:0xf1/255.0f
                           green:0xc4/255.0f
                            blue:0x0f/255.0f alpha:1];
}

+(void)setCellColor:(NSString*)periorityValue cell :(UITableViewCell*)cell{
   
    
    if([periorityValue isEqual:@"High"]){
        cell.backgroundColor = [ColorUtilViewController highColor];
        
    }else if ([periorityValue isEqual:@"Medium"]){
        cell.backgroundColor = [ColorUtilViewController mediumColor];
        
    }else{
        cell.backgroundColor = [ColorUtilViewController lowColor];
    }
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
