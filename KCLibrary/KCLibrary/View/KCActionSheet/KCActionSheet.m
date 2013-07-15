//
//  KCActionSheet.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCActionSheet.h"

@interface KCActionSheet()

@property (nonatomic, copy) void (^cancelCompletion)(BOOL);
@property (nonatomic, copy) void (^firstCompletion)(BOOL);
@property (nonatomic, copy) void (^secondCompletion)(BOOL);
@property (nonatomic, copy) void (^thirdCompletion)(BOOL);

@end

@implementation KCActionSheet


- (id)initWithOkayTitle:(NSString *)title
       cancelCompletion:(void (^)(BOOL))cancelCompletion
         okayCompletion:(void (^)(BOOL))okayCompletion
{
    return [self initWithTitle:title
             cancelButtonTitle:@"Cancel"
              firstButtonTitle:@"Ok"
             secondButtonTitle:nil
              thirdButtonTitle:nil
              cancelCompletion:cancelCompletion
               firstCompletion:okayCompletion
              secondCompletion:nil
               thirdCompletion:nil];
}

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
   firstButtonTitle:(NSString *)firstButtonTitle
  secondButtonTitle:(NSString *)secondButtonTitle
   thirdButtonTitle:(NSString *)thirdButtonTitle
   cancelCompletion:(void (^)(BOOL))cancelCompletion
    firstCompletion:(void (^)(BOOL))firstCompletion
   secondCompletion:(void (^)(BOOL))secondCompletion
    thirdCompletion:(void (^)(BOOL))thirdCompletion
{
    self = [super initWithTitle:title
                       delegate:self
              cancelButtonTitle:cancelButtonTitle
         destructiveButtonTitle:nil
              otherButtonTitles:firstButtonTitle, secondButtonTitle, thirdButtonTitle, nil];
    
    if (self)
    {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(dismissActionSheet:)
                                                     name:KCActionSheetDismissNotificationKey
                                                   object:nil];
        
        self.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        self.cancelCompletion = cancelCompletion;
        self.firstCompletion = firstCompletion;
        self.secondCompletion = secondCompletion;
        self.thirdCompletion = thirdCompletion;
    }
    
    return self;
}


///////////////////////////////////////////////
///////////////////////////////////////////////
// - UIActionSheetDelegate Methods
///////////////////////////////////////////////
///////////////////////////////////////////////

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex)
    {
        if (self.cancelCompletion)
        {
            self.cancelCompletion(YES);
        }
    }
    else if (buttonIndex == actionSheet.firstOtherButtonIndex)
    {
        if (self.firstCompletion)
        {
            self.firstCompletion(YES);
        }
    }
    else if (buttonIndex == 2)
    {
        if (self.secondCompletion)
        {
            self.secondCompletion(YES);
        }
        
    }
    else if (buttonIndex == 3)
    {
        if (self.thirdCompletion)
        {
            self.thirdCompletion(YES);
        }
    }
    
    self.cancelCompletion = nil;
    self.firstCompletion = nil;
    self.secondCompletion = nil;
    self.thirdCompletion = nil;
}

- (void)dismissActionSheet:(NSNotification *)notification
{
    self.cancelCompletion = nil;
    [self dismissWithClickedButtonIndex:self.cancelButtonIndex
                               animated:YES];
}

@end
