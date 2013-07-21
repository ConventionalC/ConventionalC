#import "UIImage+ConventionalC.h"

@implementation UIImage (ConventionalC)

-(NSData*)pngRepresentation
{
    return UIImagePNGRepresentation(self);
}

@end
