#import "UIDevice+ConventionalC.h"
#import "ConventionalC.h"

@implementation UIDevice(ConventionalC)

+(BOOL)isPad
{
    return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+(BOOL)isPhone
{
    return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+(BOOL)isInLandscape
{
    return UIDeviceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation);
}

+(BOOL)isInPortrait
{
    return UIDeviceOrientationIsPortrait(UIDevice.currentDevice.orientation);
}

@end
