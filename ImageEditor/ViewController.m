//
//  ViewController.m
//  ImageEditor
//
//  Created by Amit Tripathi on 14/03/22.
//

#import "ViewController.h"

#define kWidth 1980
#define kHeight 1080

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    NSLog(@"button-Tapped***********");
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
//    self.imgView.image = image;
//    self.smallImgView.image = image;
    [self resizedCapturedImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)resizedCapturedImage:(UIImage *)rawImage {
    
    UIImage *resizedImage = [ImageUtility imageWithImage:rawImage
                                            scaledToMaxWidth: kWidth
                                                   maxHeight: kHeight];
    _imgView.image = resizedImage;
    _smallImgView.image = resizedImage;
    
    [self imageSizeAfterAspectFit:_smallImgView];
    
}

-(CGSize)imageSizeAfterAspectFit:(UIImageView*)imgview{


    float newwidth;
    float newheight;

    UIImage *image=imgview.image;

    if (image.size.height>=image.size.width){
        newheight=imgview.frame.size.height;
        newwidth=(image.size.width/image.size.height)*newheight;

        if(newwidth>imgview.frame.size.width){
            float diff=imgview.frame.size.width-newwidth;
            newheight=newheight+diff/newheight*newheight;
            newwidth=imgview.frame.size.width;
        }

    }
    else{
        newwidth=imgview.frame.size.width;
        newheight=(image.size.height/image.size.width)*newwidth;

        if(newheight>imgview.frame.size.height){
            float diff=imgview.frame.size.height-newheight;
            newwidth=newwidth+diff/newwidth*newwidth;
            newheight=imgview.frame.size.height;
        }
    }

    NSLog(@"image after aspect fit: width=%f height=%f",newwidth,newheight);


    //adapt UIImageView size to image size
    //imgview.frame=CGRectMake(imgview.frame.origin.x+(imgview.frame.size.width-newwidth)/2,imgview.frame.origin.y+(imgview.frame.size.height-newheight)/2,newwidth,newheight);

    return CGSizeMake(newwidth, newheight);

}

@end
