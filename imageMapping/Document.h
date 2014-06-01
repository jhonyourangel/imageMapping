//
//  Document.h
//  imageMapping
//
//  Created by AiU on 16/05/14.
//  Copyright (c) 2014 AiU. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument
@property (strong) IBOutlet NSImageView *imageView;
@property (strong) IBOutlet NSImageCell *imageCell;

@end
