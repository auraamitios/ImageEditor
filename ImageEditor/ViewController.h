//
//  ViewController.h
//  ImageEditor
//
//  Created by Amit Tripathi on 14/03/22.
//


#import <UIKit/UIKit.h>
#import "ImageUtility.h"

@interface ViewController : UIViewController {
    
}

-(void)resizedCapturedImage:(UIImage *)rawImage;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *smallImgView;



@end

