//
//  KCActionSheet.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KCActionSheetDismissNotificationKey @"KCActionSheetDismissNotificationKey"

@interface KCActionSheet : UIActionSheet < UIActionSheetDelegate > 

- (id)initWithOkayTitle:(NSString *)title
       cancelCompletion:(void (^)(BOOL))cancelCompletion
         okayCompletion:(void (^)(BOOL))okayCompletion;

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
   firstButtonTitle:(NSString *)firstButtonTitle
  secondButtonTitle:(NSString *)secondButtonTitle
   thirdButtonTitle:(NSString *)thirdButtonTitle
   cancelCompletion:(void (^)(BOOL))cancelCompletion
    firstCompletion:(void (^)(BOOL))firstCompletion
   secondCompletion:(void (^)(BOOL))secondCompletion
    thirdCompletion:(void (^)(BOOL))thirdCompletion;
@end
