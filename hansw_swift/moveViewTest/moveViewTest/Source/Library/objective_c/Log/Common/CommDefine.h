//
//  CommDefine.h
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/22.
//

#ifndef CommDefine_h
#define CommDefine_h

@class NSString;
#ifdef __cplusplus
extern "C" {
#endif //__cplusplus

//#define _BUNDLEID_ @"co.kr.hsw.LogSearchi"
#define _BUNDLEID_ @"co.kr.miaps.hansw"
#define NSLocalizedStringEx(x) NSLocalizedStringFromTableInBundle(x,nil,[NSBundle bundleWithIdentifier:_BUNDLEID_],@"")

typedef enum _
{
    LOG_NONE_LEBEL,
    LOG_ERROR_LEBEL = 1,
    LOG_DEBUG_LEBEL,
    LOG_DEBUG_VIEW = 100, //웹에러 로그나 그밖의 기타 정보를 보여준다.
    LOG_WEBSERVER_LEBEL   //웹서버 로그를 보여준다.
}MyLogLebel;

#define D_Flag1 0x00000001  //설명1
#define D_Flag2 0x00000002  //설명2


void SetLogLebel(MyLogLebel nLebel);
void MyLogOrg(int nLebel,NSString* format,...);
MyLogLebel GetLogLebel(void);
#define MyLogE(f,...)           MyLogOrg(1,f, ##__VA_ARGS__)
#define MyLogD(f,...)           MyLogOrg(2,f, ##__VA_ARGS__)

#ifdef __cplusplus
}
#endif //__cplusplus

#endif /* CommDefine_h */
