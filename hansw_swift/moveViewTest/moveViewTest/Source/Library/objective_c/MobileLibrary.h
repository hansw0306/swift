//
//  MobileLibrary.h
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

#import <Foundation/Foundation.h>
//unzip
#import "ZipArchive.h"
//LogView
#import "UIImage+Bundle.h"
#import "SWErrorViewController.h"
#import "CommDefine.h"
@protocol MobileLibraryDelegate <NSObject>
- (void)MobileLibraryResutlAction;
@end


@interface MobileLibrary : NSObject

#pragma mark - 변수
@property (strong, nonatomic) NSDictionary *man_Info; //
@property (nonatomic,weak) id<MobileLibraryDelegate> delegate;
//LogButton
@property (nonatomic,retain) UIButton* mLogButton;

#pragma mark - 함수
//여기를 통해서 Obj_func을 부를수 있도록 작업하도록 하자.
- (void)onMoibleLib:(NSDictionary *)jsData;
//unzip
-(BOOL) UnzipResource;
//logView
-(void) MylogSetting:(int)log;
-(void) Mylog:(NSString*)msg;
@end

