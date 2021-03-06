/*
 Copyright (c) 2015, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ORKCustomStepView.h"
#import "ORKCustomStepView_Internal.h"
#import "ORKSurveyAnswerCell.h"

@implementation ORKActiveStepCustomView

- (void)resetStep:(ORKStepViewController *)viewController {}
- (void)startStep:(ORKStepViewController *)viewController {}
- (void)suspendStep:(ORKStepViewController *)viewController {}
- (void)resumeStep:(ORKStepViewController *)viewController {}
- (void)finishStep:(ORKStepViewController *)viewController {}

- (void)updateDisplay:(ORKActiveStepViewController *)viewController {}
@end


@implementation ORKQuestionStepCustomView

@end

@implementation ORKQuestionStepCellHolderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

- (void)tapAction {
    [_cell becomeFirstResponder];
}

- (void)setCell:(ORKSurveyAnswerCell *)cell {
    [self removeConstraints:[self constraints]];
    [_cell removeFromSuperview];
    _cell = cell;
    
    [_cell setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    if ([[_cell class] shouldDisplayWithSeparators]) {
        _cell.showTopSeparator = YES;
        _cell.showBottomSeparator = YES;
        //_cell.topSeparatorLeftInset = 0;
        //_cell.bottomSeparatorLeftInset = 0;
    }
    
    [self addSubview:_cell];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_cell attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_cell attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_cell attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_cell attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

@end