/*
 
 JCColor is a subclass of UIColor, extending the methods.
 http://github.com/joaocolombo
 
 */

#import "JCColor.h"

@implementation JCColor

#pragma mark - Create color from values

+ (UIColor *)colorWithRGB:(NSString *)colorString 
{
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@","];
    
    NSArray *rgb = [colorString componentsSeparatedByString:@","];
    
    return [UIColor colorWithRed:[[rgb objectAtIndex:0] floatValue]/255 green:[[rgb objectAtIndex:1] floatValue]/255 blue:[[rgb objectAtIndex:2] floatValue]/255 alpha:1];    
}

+ (UIColor *)colorWithRGBPercentage:(NSString *)colorString
{
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@","];
    
    NSArray *rgb = [colorString componentsSeparatedByString:@","];
    
    return [UIColor colorWithRed:[[rgb objectAtIndex:0] floatValue]/100 green:[[rgb objectAtIndex:1] floatValue]/100 blue:[[rgb objectAtIndex:2] floatValue]/100 alpha:1];
}

+ (UIColor *)colorWithRGBA:(NSString *)colorString
{
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@","];
    
    NSArray *rgba = [colorString componentsSeparatedByString:@","];
    
    return [UIColor colorWithRed:[[rgba objectAtIndex:0] floatValue]/255 green:[[rgba objectAtIndex:1] floatValue]/255 blue:[[rgba objectAtIndex:2] floatValue]/255 alpha:0.5f];
}

+ (UIColor *)colorWithHSB:(NSString *)colorString 
{
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@","];
    
    NSArray *hsb = [colorString componentsSeparatedByString:@","];
    
    return [UIColor colorWithHue:[[hsb objectAtIndex:0] floatValue]/360 saturation:[[hsb objectAtIndex:1] floatValue]/100 brightness:[[hsb objectAtIndex:2] floatValue]/100  alpha:1];
    
}

+ (UIColor *)colorWithHSL:(NSString *)colorString 
{
    return 0;
    
}

+ (UIColor *)colorWithHEX:(NSString *)colorString; 
{
    
    /*
        
     NOTE: #fff = #ffffff = #ff (all with optinoal '#').
     
     */
    
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([[NSString stringWithFormat:@"%c",[colorString characterAtIndex:0]] isEqualToString: @"#"]) {
        colorString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    if ([colorString length] == 3) {
        colorString = [NSString stringWithFormat:@"%c%c%c%c%c%c",[colorString characterAtIndex:0], [colorString characterAtIndex:0], [colorString characterAtIndex:1], [colorString characterAtIndex:1], [colorString characterAtIndex:2], [colorString characterAtIndex:2]];
    }
    if ([colorString length] == 2) {
        colorString = [NSString stringWithFormat:@"%c%c%c%c%c%c",[colorString characterAtIndex:0], [colorString characterAtIndex:1], [colorString characterAtIndex:0], [colorString characterAtIndex:1], [colorString characterAtIndex:0], [colorString characterAtIndex:1]];
    }
    
    NSArray *hex = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",nil];
    
    float r = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[[colorString uppercaseString] characterAtIndex:0]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[[colorString uppercaseString] characterAtIndex:1]]];
    float g = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[[colorString uppercaseString] characterAtIndex:2]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[[colorString uppercaseString] characterAtIndex:3]]];
    float b = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[[colorString uppercaseString] characterAtIndex:4]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[[colorString uppercaseString ]characterAtIndex:5]]];
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)colorWithWA:(NSString *)colorString
{
    
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@","];
    
    NSArray *wa = [colorString componentsSeparatedByString:@","];
    
    return [UIColor colorWithWhite:[[wa objectAtIndex:0] floatValue]/100 alpha:[[wa objectAtIndex:1] floatValue]/100];
}

#pragma mark - Color Operations

+ (UIColor *)addRGBColors:(NSArray *)colorsArray  
{

    int c = 0;
    float r = 0;
    float g = 0;
    float b = 0;
    do {
        
        r = r + [[[[JCColor getRGBValueOf:[colorsArray objectAtIndex:c]]  componentsSeparatedByString:@" "] objectAtIndex:0] floatValue];
        g = g + [[[[JCColor getRGBValueOf:[colorsArray objectAtIndex:c]]  componentsSeparatedByString:@" "] objectAtIndex:1] floatValue];
        b = b + [[[[JCColor getRGBValueOf:[colorsArray objectAtIndex:c]]  componentsSeparatedByString:@" "] objectAtIndex:2] floatValue];
        
        c++;
        
    } while (c != [colorsArray count]);
    
    r = r/c;
    g = g/c;
    b = b/c;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)darkColor:(UIColor *)color withIntensity:(float)intensity 
{
    
    /*
     
     NOTE: the intensity is a percentage value.
     
    */
    
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    return [UIColor colorWithRed:([[colorRGB objectAtIndex:0] floatValue] - (intensity * 255/100))/255 green:([[colorRGB objectAtIndex:1] floatValue] - (intensity * 255/100))/255 blue:([[colorRGB objectAtIndex:2] floatValue] - (intensity * 255/100))/255 alpha:1];
    
}

+ (UIColor *)lightColor:(UIColor *)color withIntensity:(float)intensity
{
    
    /*
     
     NOTE: the intensity is a percentage value.
     
     */
    
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    return [UIColor colorWithRed:([[colorRGB objectAtIndex:0] floatValue] + (intensity * 255/100))/255 green:([[colorRGB objectAtIndex:1] floatValue] + (intensity * 255/100))/255 blue:([[colorRGB objectAtIndex:2] floatValue] + (intensity * 255/100))/255 alpha:1];
    
}

+ (UIColor *)invertColor:(UIColor *)color 
{
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    float r;
    float g;
    float b;
    
    if ([[colorRGB objectAtIndex:0] floatValue] >= 127) {
        r = 127 - ([[colorRGB objectAtIndex:0] floatValue] - 127);
    } else {
        r = 127 + (127 - [[colorRGB objectAtIndex:0] floatValue]);
    }
    if ([[colorRGB objectAtIndex:1] floatValue] >= 127) {
        g = 127 - ([[colorRGB objectAtIndex:1] floatValue] - 127);
    } else {
        g = 127 + (127 - [[colorRGB objectAtIndex:1] floatValue]);
    }
    if ([[colorRGB objectAtIndex:2] floatValue] >= 127) {
        b = 127 - ([[colorRGB objectAtIndex:2] floatValue] - 127);
    } else {
        b = 127 + (127 - [[colorRGB objectAtIndex:2] floatValue]);;
    }
    
    return [JCColor colorWithRGB:[NSString stringWithFormat:@"%f %f %f",r, g, b]];
    
}

+ (UIColor *)grayScaleColor:(UIColor *)color
{
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    float grayScale = ([[colorRGB objectAtIndex:0] floatValue] + [[colorRGB objectAtIndex:1] floatValue] + [[colorRGB objectAtIndex:2] floatValue])/3;
    
    return [JCColor colorWithRGB:[NSString stringWithFormat:@"%f %f %f",grayScale, grayScale, grayScale]];
}

#pragma mark - Adjust Color

+ (UIColor *)adjustColor:(UIColor *)color addRed:(float)r
{
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    return [UIColor colorWithRed:([[colorRGB objectAtIndex:0] floatValue] + r)/255 green:[[colorRGB objectAtIndex:1] floatValue]/255 blue:[[colorRGB objectAtIndex:2] floatValue]/255 alpha:1];
    
}

+ (UIColor *)adjustColor:(UIColor *)color addGreen:(float)g
{
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    return [UIColor colorWithRed:[[colorRGB objectAtIndex:0] floatValue]/255 green:([[colorRGB objectAtIndex:1] floatValue] + g)/255 blue:[[colorRGB objectAtIndex:2] floatValue]/255 alpha:1];
    
}

+ (UIColor *)adjustColor:(UIColor *)color addBlue:(float)b
{
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    return [UIColor colorWithRed:[[colorRGB objectAtIndex:0] floatValue]/255 green:[[colorRGB objectAtIndex:1] floatValue]/255 blue:([[colorRGB objectAtIndex:2] floatValue] + b)/255 alpha:1];
    
}

+ (UIColor *)adjustColor:(UIColor *)color addAlpha:(float)a
{
    return 0;
}

+ (UIColor *)adjustColor:(UIColor *)color addHue:(float)h
{
    return 0;
}

+ (UIColor *)adjustColor:(UIColor *)color addSaturation:(float)s
{
    return 0;
}

+ (UIColor *)adjustColor:(UIColor *)color addBrightness:(float)b
{
    return 0;
}

#pragma mark - Retrieving color information 

+ (NSString *)getRGBValueOf:(UIColor *)color
{
    const CGFloat *colorRGB = CGColorGetComponents([color CGColor]);
    
    float r = colorRGB[0] * 255;
    float g = colorRGB[1] * 255;
    float b = colorRGB[2] * 255;
    
    return [NSString stringWithFormat:@"%f %f %f",r,g,b];
}

+ (NSString *)getRGBPercentageOf:(UIColor *)color
{
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    
    return [NSString stringWithFormat:@"%f%% %f%% %f%%",[[colorRGB objectAtIndex:0] floatValue]/255 * 100, [[colorRGB objectAtIndex:0] floatValue]/255 * 100, [[colorRGB objectAtIndex:0] floatValue]/255 * 100];
}

+ (NSString *)getHSBValueOf:(UIColor *)color
{
    return 0;
}

+ (NSString *)getHEXValueOf:(UIColor *)color 
{
    NSArray *hex = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",nil];
    
    NSArray *colorRGB = [[JCColor getRGBValueOf:color] componentsSeparatedByString:@" "];
    float r = [[colorRGB objectAtIndex:0] floatValue];
    float g = [[colorRGB objectAtIndex:1] floatValue];
    float b = [[colorRGB objectAtIndex:2] floatValue];
    
    return [NSString stringWithFormat:@"%@%@%@",[NSString stringWithFormat:@"%@%@",[hex objectAtIndex:r/16],[hex objectAtIndex:r - ((r/16) * 16)]],[NSString stringWithFormat:@"%@%@",[hex objectAtIndex:g/16],[hex objectAtIndex:g - ((g/16) * 16)]],[NSString stringWithFormat:@"%@%@",[hex objectAtIndex:b/16],[hex objectAtIndex:b - ((b/16) * 16)]]];
    
}

#pragma mark - Other methods

+ (UIColor *)randomColor 
{
    float r = arc4random() % 255;
    float g = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)randomColorWithRed:(float)r 
{
    
    float g = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)randomColorWithGreen:(float)g
{
    float r = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)randomColorWithBlue:(float)b
{
    float r = arc4random() % 255;
    float g = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)randomColorWithRedPercentage:(float)r
{
    float g = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/100 green:g/255 blue:b/255 alpha:1];
}

+ (UIColor *)randomColorWithGreenPercentage:(float)g
{
    float r = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/100 blue:b/255 alpha:1];
}

+ (UIColor *)randomColorWithBluePercentage:(float)b
{
    float r = arc4random() % 255;
    float g = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/100 alpha:1];
}

+ (UIColor *)randomColorWithAlpha:(float)a
{
    float r = arc4random() % 255;
    float g = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/100 alpha:a/100];
}

+ (UIColor *)randomColorWithHue:(float)h
{
    float s = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:1];
}

+ (UIColor *)randomColorWithSaturation:(float)s 
{
    float h = arc4random() % 255;
    float b = arc4random() % 255;
    
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:1];
}

+ (UIColor *)randomColorWithBrightness:(float)b 
{
    float h = arc4random() % 255;
    float s = arc4random() % 255;
    
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:1];
}

@end