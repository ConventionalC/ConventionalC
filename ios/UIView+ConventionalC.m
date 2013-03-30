#import "UIView+ConventionalC.h"

@implementation UIView(ConventionalC)

-(void)updateFrame:(CGRect(^)(CGRect))update
{
    self.frame = update(self.frame);
}

-(void)setOrigin:(CGPoint)origin
{
    [self updateFrame:^CGRect(CGRect frame){ frame.origin = origin; return frame;}];
}

-(CGPoint)origin
{
    return self.frame.origin;
}

-(void)setX:(CGFloat)x
{
    [self updateFrame:^CGRect(CGRect frame){ frame.origin.x = x; return frame;}];
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y
{
    [self updateFrame:^CGRect(CGRect frame){ frame.origin.y = y; return frame;}];
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setSize:(CGSize)size
{
    [self updateFrame:^CGRect(CGRect frame){ frame.size = size; return frame;}];
}

-(CGSize)size
{
    return self.frame.size;
}

-(void)setWidth:(CGFloat)width
{
    [self updateFrame:^CGRect(CGRect frame){ frame.size.width = width; return frame;}];
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height
{
    [self updateFrame:^CGRect(CGRect frame){ frame.size.height = height; return frame;}];
}

-(CGFloat)height
{
    return self.frame.size.height;
}

@end
