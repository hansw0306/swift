//
//  SWErrorViewDetailController.h
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/24.
//

#import <UIKit/UIKit.h>
#import "SWErrorViewController.h"
@interface SWErrorViewDetailController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *mText;
@property (nonatomic,retain) SWError* mError;
@end

