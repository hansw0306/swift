//
//  CommDefine.cpp
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/22.
//
#import <Foundation/Foundation.h>
#import "SWErrorViewController.h"
#include "CommDefine.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>

MyLogLebel gLogLebel = LOG_NONE_LEBEL;

void SetLogLebel(MyLogLebel nLebel)
{
    gLogLebel = nLebel;
}

MyLogLebel GetLogLebel()
{
    return gLogLebel;
}

// LogView에 log를 삽입한다.
void MyLogOrg(int nLebel,NSString* format,...)
{
    if(nLebel > (int)gLogLebel) return;

    static NSDateFormatter* formater = NULL;
    if(formater == NULL)
    {
        formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"hh:mm:ss.SSSS"];
    }

    va_list argList;
    va_start(argList, format);
    NSString *formatS = [[NSString alloc] initWithFormat:format arguments:argList];
    va_end(argList);
    if(GetLogLebel() >= LOG_DEBUG_VIEW)
    {
        if(nLebel == 0) return;
        else if(nLebel == 1)
        {
            [[SWErrorList Share] InsertList:[NSNumber numberWithInt:-1] Error:formatS File:@"Error"];
            NSLog(@"[%@]%@",@"Error",formatS);
        }
        else
        {
            [[SWErrorList Share] InsertList:[NSNumber numberWithInt:-1] Error:formatS File:@"Debug"];
            NSLog(@"[%@]%@",@"Info",formatS);
        }
    }
    else
    {
        if(nLebel == 0) return;
        else if(nLebel == 1)
            NSLog(@"[%@]%@",@"Error",formatS);
        else
            NSLog(@"[%@]%@",@"Info",formatS);
    }
    
}
