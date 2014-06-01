//
//  imageView.h
//  imageMapping
//
//  Created by AiU on 16/05/14.
//  Copyright (c) 2014 AiU. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface imageView : NSImageView

@property (nonatomic, strong) IBOutlet NSTextField *xNumber;
@property (nonatomic, strong) IBOutlet NSTextField *yNumber;

@property(nonatomic, strong) NSImage *myImage;


- (IBAction)cropImage:(id)sender;

- (IBAction)resizeImage:(id)sender;




@end
