// Created by Daniel Sefton, 2012
// Do what you want license

#import "UIImage+Sprite.h"
#import "XMLReader.h"

@implementation UIImage (Sprite)

+ (NSDictionary*)spritesWithContentsOfFile:(NSString*)filename
{
	CGFloat scale = [UIScreen mainScreen].scale;
    NSString* file = [[filename lastPathComponent] stringByDeletingPathExtension];
	if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && 
		(scale == 2.0))
	{
		file = [NSString stringWithFormat:@"%@@2x", file];
	}
	NSString* extension = [filename pathExtension];
	NSData* data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:extension]];
	NSError* error = nil;
	NSDictionary* xmlDictionary = [XMLReader dictionaryForXMLData:data error:&error];
	NSDictionary* xmlTextureAtlas = [xmlDictionary objectForKey:@"TextureAtlas"];
	UIImage* image = [UIImage imageNamed:[xmlTextureAtlas objectForKey:@"imagePath"]];
	CGSize size = CGSizeMake([[xmlTextureAtlas objectForKey:@"width"] integerValue], 
                             [[xmlTextureAtlas objectForKey:@"height"] integerValue]);
    
	if (!image || CGSizeEqualToSize(size, CGSizeZero)) return nil;
	CGImageRef spriteSheet = [image CGImage];
	NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
    
	NSArray* xmlSprites = [xmlTextureAtlas objectForKey:@"sprite"];
	for (NSDictionary* xmlSprite in xmlSprites)
	{
		CGRect unscaledRect = CGRectMake([[xmlSprite objectForKey:@"x"] integerValue],
                                         [[xmlSprite objectForKey:@"y"] integerValue],
                                         [[xmlSprite objectForKey:@"w"] integerValue],
                                         [[xmlSprite objectForKey:@"h"] integerValue]);
        CGImageRef sprite = CGImageCreateWithImageInRect(spriteSheet, unscaledRect);
        // If this is a @2x image it is twice as big as it should be.
        // Take care to consider the scale factor here.
		[tempDictionary setObject:[UIImage imageWithCGImage:sprite scale:scale orientation:UIImageOrientationUp] forKey:[xmlSprite objectForKey:@"n"]];
		CGImageRelease(sprite);
	}
    
    return [NSDictionary dictionaryWithDictionary:tempDictionary];
}

@end