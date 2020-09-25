//
//  SWErrorViewController.h
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/22.
//

#import <UIKit/UIKit.h>

@interface SWError : NSObject
@property (nonatomic,retain) NSString* sLine;
@property (nonatomic,retain) NSString* sError;
@property (nonatomic,retain) NSString* sFile;
@end

@interface SWErrorList : NSObject
@property (nonatomic,retain) NSMutableArray* mList;
-(void) InsertList:(NSNumber*)Line Error:(NSString*)sError File:(NSString*)sFile;
-(void) ClearList;
+ (SWErrorList*) Share;
@end

@interface SWErrorViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
+(void) ShowJSErrorView:(UIViewController*)Con;
@end

