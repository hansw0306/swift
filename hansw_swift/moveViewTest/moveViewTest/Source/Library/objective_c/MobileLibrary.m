//
//  MobileLibrary.m
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

#import "MobileLibrary.h"

@implementation MobileLibrary

-(void) NSLogPrint
{
    NSLog(@"printTEST");
}


- (void)onMoibleLib:(NSDictionary *)jsData
{
        NSString* sName         = [jsData objectForKey:@"name"];
        NSString* sMothod       = [jsData objectForKey:@"method"];
        NSObject* funcParam     = [jsData objectForKey:@"param"]; //정보...
    
    if(sName == nil) return;
    if([sName compare:@"Native" options:NSCaseInsensitiveSearch] == 0) //
    {
        if([sMothod compare:@"unzip" options:NSCaseInsensitiveSearch] == 0) //
        {
            
        }
    }
    
}

//집파일을 찾아 앞축을 풀어주는 로직
-(BOOL) UnzipResource
{
    NSString *sZip = [[NSBundle mainBundle] pathForResource:@"Resource" ofType:@"zip"];
    
     //1> 리소스파일을 압축해제할 경로를 지정한다
     NSString *documentPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
     NSString* unzipPath= [documentPath stringByAppendingPathComponent:@"Resource"];
     
     //2> 디렉토리 만들어준다.
     if (![[NSFileManager defaultManager] fileExistsAtPath:unzipPath])
     {
         [[NSFileManager defaultManager] createDirectoryAtPath:unzipPath withIntermediateDirectories:YES attributes:nil error:nil];
     }
     //3> 리소스파이을 압축해제한다.
     ZipArchive *archive = [[ZipArchive alloc] init];
     [archive UnzipOpenFile:sZip];
     
     //4> 압축풀기
     if(![archive UnzipFileTo:unzipPath overWrite:YES])
     {
         //압축풀기에 실패했습니다.
         //[self performSelectorOnMainThread:@selector(CloseHome) withObject:nil waitUntilDone:NO];
         return false;
     }
     else
     {
         //압축풀기 성공
         //NSString* sURL = [NSString stringWithFormat:@"%@/%@",documentPath,@"RequestAuth/html/common/app_auth_info.html"];
         //NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:sURL]];
         [archive UnzipCloseFile];
         
         return true;
     }
}

@end
