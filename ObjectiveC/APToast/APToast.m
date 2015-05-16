//
//  APToast.m
//  APToastSampleProject
//
//  Created by Andrej Poljanec on 5/16/15.
//  Copyright (c) 2015 Andrej Poljanec. All rights reserved.
//

#import "APToast.h"

#define APTOAST_PADDING 8

@implementation APToast {
    UIView *parentView;
}

- (id) initWithParent:(UIView *)parent attributedMessage:(NSAttributedString *)message {
    self = [super init];
    if (self) {
        parentView = parent;
        self.alpha = 0;
        self.frame = parent.frame;
        
        CGRect fullScreenFrame = [[UIScreen mainScreen] bounds];
        
        CGFloat maxHeight = MAXFLOAT;
        CGFloat maxWidth = fullScreenFrame.size.width - 4 * APTOAST_PADDING;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, maxWidth, maxHeight)];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textAlignment = NSTextAlignmentCenter;
        label.attributedText = message;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        [label sizeToFit];
        CGSize size = label.frame.size;
        
        CGPoint centerPoint = CGPointMake(fullScreenFrame.size.width / 2, fullScreenFrame.size.height / 10 * 8);
        
        CGRect mainFrame = CGRectMake(centerPoint.x - size.width / 2 - APTOAST_PADDING, centerPoint.y - size.height / 2 - APTOAST_PADDING, size.width + 2 * APTOAST_PADDING, size.height + 2 * APTOAST_PADDING);
        UIView *mainView = [[UIView alloc] initWithFrame:mainFrame];
        mainView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        mainView.layer.cornerRadius = 10;
        mainView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.1].CGColor;
        mainView.layer.borderWidth = 1;
        mainView.layer.shadowColor = [UIColor blackColor].CGColor;
        mainView.layer.shadowRadius = 2;
        mainView.layer.shadowOpacity = 0.5;
        mainView.layer.shadowOffset = CGSizeMake(0, 0);
        [self addSubview:mainView];
        
        label.frame = CGRectMake(APTOAST_PADDING, APTOAST_PADDING, size.width, size.height);
        [mainView addSubview:label];
        
    }
    return self;
}
- (id) initWithParent:(UIView *)parent message:(NSString *)message {
    return [self initWithParent:parent attributedMessage:[[NSAttributedString alloc] initWithString:message]];
}

- (void)show {
    [parentView addSubview:self];
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         [self performSelector:@selector(hide) withObject:nil afterDelay:2];
                     }];
}

- (void)hide {
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

@end
