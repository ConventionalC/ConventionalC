#import "UIView+XibConfiguration.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView(XibConfiguration)

-(void)setBorderColor:(UIColor*)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

-(UIColor*)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end
