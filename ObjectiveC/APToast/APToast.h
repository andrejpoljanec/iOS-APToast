//
//  APToast.h
//  APToastSampleProject
//
//  Created by Andrej Poljanec on 5/16/15.
//  Copyright (c) 2015 Andrej Poljanec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APToast : UIView

- (id)initWithParent:(UIView *)parent message:(NSString *)message;
- (id)initWithParent:(UIView *)parent attributedMessage:(NSAttributedString *)message;
- (void)show;

@end
