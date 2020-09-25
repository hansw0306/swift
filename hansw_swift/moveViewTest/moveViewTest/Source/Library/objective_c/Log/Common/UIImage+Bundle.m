//
//  UIImage+Bundle.m
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/22.
//

#import "UIImage+Bundle.h"

@implementation UIImage (Bundle)
+ (UIImage*)imageNamed:(NSString *)imageName Class:(Class)cls
{
    return [UIImage imageNamed:imageName bundle:[NSBundle bundleForClass:cls]];
}



+ (UIImage*)imageNamed:(NSString*)imageName bundle:(NSBundle*)bundle
{
    // Extract base name and extension
    NSString* imageBaseName = [imageName stringByDeletingPathExtension];
    NSString* imageExt = [imageName pathExtension];
    if (!imageExt.length) imageExt = @"png";
    
    NSString* imagePath = nil;
    
    // Try retina version if available
    BOOL isRetina = ([[UIScreen mainScreen] scale] == 2.0);
    if (isRetina)
    {
        NSString* retinaImageBaseName = [NSString stringWithFormat:@"%@@2x", imageBaseName];
        imagePath = [bundle pathForResource:retinaImageBaseName ofType:imageExt];
    }
    
    // If not a Retina screen or retina image not found, try regular image
    if (!imagePath)
    {
        imagePath = [bundle pathForResource:imageBaseName ofType:imageExt];
        isRetina = NO;
    }
    
    // Build the image
    UIImage* image = [UIImage imageWithContentsOfFile:imagePath];
    // If retina version, set the scale appropriately
    if (isRetina)
    {
        image = [UIImage imageWithCGImage:image.CGImage scale:2.0 orientation:UIImageOrientationUp];
    }
    
    return image;
}
@end
