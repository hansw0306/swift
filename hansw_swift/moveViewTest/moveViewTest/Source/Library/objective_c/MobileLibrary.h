//
//  MobileLibrary.h
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MobileLibrary : NSObject
#pragma mark - 변수
@property (strong, nonatomic) NSDictionary *man_Info; // 그림을 가지고올 객체



#pragma mark - 함수
-(void) NSLogPrint;
@end

