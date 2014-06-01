//
//  imageView.m
//  imageMapping
//
//  Created by AiU on 16/05/14.
//  Copyright (c) 2014 AiU. All rights reserved.
//

#import "imageView.h"

@implementation imageView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

-(void)awakeFromNib
{
   [self setImage:[self myImage]];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    // Drawing code here.
}


-(void)resizeImage:(id)sender
{
    [self.myImage setSize:self.bounds.size];
    NSLog(@"image %@",_myImage);
    [self setImage:self.myImage];
}


-(NSImage *)myImage
{
    NSString* imageName = [[NSBundle mainBundle] pathForResource:@"gray" ofType:@"png"];
    NSImage *image2 = [[NSImage alloc] initWithContentsOfFile:imageName];
    
    [image2 setSize:self.bounds.size];
    NSLog(@"image2 %@",image2);

    return image2;
}



#pragma mark - cropping algorithm

-(void)cropImage:(id)sender
{
    [self convert];
}

-(void)convert
{
    [self.myImage drawInRect:NSMakeRect(0, 0, 100, 100) fromRect:NSMakeRect(100, 100, 100, 100) operation:NSCompositeCopy fraction:1.0];
    
    NSBitmapImageRep *offscreenRep = [[NSBitmapImageRep alloc]
                                       initWithBitmapDataPlanes:NULL
                                       pixelsWide:self.myImage.size.width
                                       pixelsHigh:self.myImage.size.height
                                       bitsPerSample:8
                                       samplesPerPixel:4
                                       hasAlpha:YES
                                       isPlanar:NO
                                       colorSpaceName:NSDeviceRGBColorSpace
                                       bitmapFormat:NSAlphaFirstBitmapFormat
                                       bytesPerRow:0
                                       bitsPerPixel:0];
    
    // set offscreen context
    NSGraphicsContext *context = [NSGraphicsContext graphicsContextWithBitmapImageRep:offscreenRep];
    [NSGraphicsContext setCurrentContext:context];
    
  //  CGImageRef imageRef = CGImageCreateWithImageInRect([_myImage cgimage], kCGImageSourceShouldAllowFloat)
}


-(void)loadCGimage
{
    NSString* imageName = [[NSBundle mainBundle] pathForResource:@"gray" ofType:@"png"];
    NSURL *url = [NSURL URLWithString:imageName];
    CFURLRef urlRef = (__bridge CFURLRef)url;

    CGImageRef *imageRef = CGImageSourceCreateWithURL(urlRef, nil);

}





@end
