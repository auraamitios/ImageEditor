//
//  ImageUtility.h
//  ImageEditor
//
//  Created by Amit Tripathi on 14/03/22.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtility : NSObject {
    
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
