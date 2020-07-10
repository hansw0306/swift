//
//  MobileLibrary.h
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZipArchive.h"


@protocol MobileLibraryDelegate <NSObject>
- (void)MobileLibraryResutlAction;
@end


@interface MobileLibrary : NSObject

#pragma mark - 변수
@property (strong, nonatomic) NSDictionary *man_Info; //
@property (nonatomic,weak) id<MobileLibraryDelegate> delegate;


#pragma mark - 함수
-(void) NSLogPrint;
-(BOOL) UnzipResource;
@end

