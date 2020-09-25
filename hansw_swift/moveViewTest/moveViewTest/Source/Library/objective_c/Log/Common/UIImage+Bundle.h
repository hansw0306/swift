//
//  UIImage+Bundle.h
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/22.
//

#import <UIKit/UIKit.h>
@interface UIImage(Bundle)
+ (UIImage*)imageNamed:(NSString *)imageName Class:(Class)cls;
+ (UIImage*)imageNamed:(NSString *)imageName bundle:(NSBundle*)bundle;
@end

