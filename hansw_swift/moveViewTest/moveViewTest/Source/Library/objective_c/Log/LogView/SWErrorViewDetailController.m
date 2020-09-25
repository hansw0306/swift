//
//  SWErrorViewDetailController.m
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/24.
//

#import "SWErrorViewDetailController.h"

@interface SWErrorViewDetailController ()

@end

@implementation SWErrorViewDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mText.text = self.mError.sError;
}

- (IBAction)OnClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
