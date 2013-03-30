#import "UIBarButtonItem+ConventionalC.h"

@implementation UIBarButtonItem(ConventionalC)

+(UIBarButtonItem*)barButtonItemWithCustomView:(UIView*)v
{
    return [[UIBarButtonItem alloc] initWithCustomView:v];
}

+(UIBarButtonItem*)barButtonItemWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
}

+(UIBarButtonItem*)barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)item target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item target:target action:action];
}

@end
