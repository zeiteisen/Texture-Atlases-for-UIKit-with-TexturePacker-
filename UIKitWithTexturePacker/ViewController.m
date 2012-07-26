//
//  ViewController.m
//  UIKitWithTexturePacker
//
//  Created by Hanno Bruns on 26.07.12.
//  Copyright (c) 2012 Hanno Bruns. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Sprite.h"

@interface ViewController ()

@property (nonatomic, strong) NSDictionary *mySprites;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mySprites = [[UIImage alloc] spritesWithContentsOfFile:@"sheet.xml"];
    UIImage *image = [self.mySprites objectForKey:@"kuwalio_jump@2x"];
    CGSize imageSize = image.size;
    CGSize screenSize = self.view.frame.size;
    int maxX = screenSize.width/imageSize.width;
    int maxY = screenSize.height/imageSize.height;
    for (int i = 0; i < maxX; i++)
    {
        for (int j = 0; j < maxY; j++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(i*imageSize.width, j*imageSize.height, imageSize.width, imageSize.height);
            [self.view addSubview:imageView];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.mySprites = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
