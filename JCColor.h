/*
 
 JCColor is under development.
 
 */

#import <Foundation/Foundation.h>

@interface JCColor : NSObject {
    
}

//create color from values
+ (UIColor *)colorWithRGB:(NSString *)colorString;
+ (UIColor *)colorWithRGBPercentage:(NSString *)colorString;
+ (UIColor *)colorWithRGBA:(NSString *)colorString; //rever.
+ (UIColor *)colorWithHSB:(NSString *)colorString;
+ (UIColor *)colorWithHSL:(NSString *)colorString;
+ (UIColor *)colorWithHEX:(NSString *)colorString;
+ (UIColor *)colorWithWA:(NSString *)colorString;

//color operations
+ (UIColor *)addRGBColors:(NSArray *)colorsArray; //rever.
+ (UIColor *)darkColor:(UIColor *)color withIntensity:(float)intensity;
+ (UIColor *)lightColor:(UIColor *)color withIntensity:(float)intensity;
+ (UIColor *)invertColor:(UIColor *)color;
+ (UIColor *)grayScaleColor:(UIColor *)color;

//adjust color
+ (UIColor *)adjustColor:(UIColor *)color addRed:(float)r;
+ (UIColor *)adjustColor:(UIColor *)color addGreen:(float)g;
+ (UIColor *)adjustColor:(UIColor *)color addBlue:(float)b;
+ (UIColor *)adjustColor:(UIColor *)color addAlpha:(float)a; //rever.
+ (UIColor *)adjustColor:(UIColor *)color addHue:(float)h; //rever.
+ (UIColor *)adjustColor:(UIColor *)color addSaturation:(float)s; //rever.
+ (UIColor *)adjustColor:(UIColor *)color addBrightness:(float)b; //rever.

//retrieving color information
+ (NSString *)getRGBValueOf:(UIColor *)color;
+ (NSString *)getRGBPercentageOf:(UIColor *)color;
+ (NSString *)getHSBValueOf:(UIColor *)color; //rever.
+ (NSString *)getHEXValueOf:(UIColor *)color;

//other methods
+ (UIColor *)randomColor;
+ (UIColor *)randomColorWithRed:(float)r;
+ (UIColor *)randomColorWithGreen:(float)g;
+ (UIColor *)randomColorWithBlue:(float)b;
+ (UIColor *)randomColorWithRedPercentage:(float)r;
+ (UIColor *)randomColorWithGreenPercentage:(float)g;
+ (UIColor *)randomColorWithBluePercentage:(float)b;
+ (UIColor *)randomColorWithAlpha:(float)a;
+ (UIColor *)randomColorWithHue:(float)h;
+ (UIColor *)randomColorWithSaturation:(float)s;
+ (UIColor *)randomColorWithBrightness:(float)b;

@end