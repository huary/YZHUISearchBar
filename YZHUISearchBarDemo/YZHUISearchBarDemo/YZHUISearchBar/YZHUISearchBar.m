//
//  YZHUISearchBar.m
//  contact
//
//  Created by yuan on 2018/12/20.
//  Copyright © 2018年 gdtech. All rights reserved.
//

#import "YZHUISearchBar.h"

@interface YZHUISearchBar ()


/* <#注释#> */
@property (nonatomic, assign) CGFloat defaultHeight;

/* <#注释#> */
@property (nonatomic, assign) UIEdgeInsets textFieldEdgeInsets;

/* <#注释#> */
@property (nonatomic, strong) UIView *searchTextFieldContentView;
/* <#注释#> */
@property (nonatomic, strong) YZHUIButton *placeholderBtn;

@end

@implementation YZHUISearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupDefault];
        [self _setupChildView];
        [self _addNotification:YES];
    }
    return self;
}

-(void)_setupDefault
{
    self.defaultHeight = 44;
    self.textFieldEdgeInsets = UIEdgeInsetsMake(8, 12, 8, 12);
}

-(void)_setupChildView
{
//    CGFloat x = self.textFieldEdgeInsets.left;
//    CGFloat y = self.textFieldEdgeInsets.top;
//    CGFloat w = MAX(self.width - self.textFieldEdgeInsets.left - self.textFieldEdgeInsets.right, 0);
//    CGFloat h = MAX(self.height - self.textFieldEdgeInsets.top - self.textFieldEdgeInsets.bottom,0);
    
    self.searchTextFieldContentView = [[UIView alloc] init];
    self.searchTextFieldContentView.backgroundColor = WHITE_COLOR;
    [self addSubview:self.searchTextFieldContentView];
    
    _inputTextField = [[UITextField alloc] init];
    self.inputTextField.backgroundColor = WHITE_COLOR;
    [self.searchTextFieldContentView addSubview:self.inputTextField];
    
    WEAK_SELF(weakSelf);
    self.placeholderBtn = [YZHUIButton buttonWithType:UIButtonTypeCustom];
    self.placeholderBtn.layoutStyle = NSButtonLayoutStyleLR | NSButtonLayoutStyleCustomSpace;
    self.placeholderBtn.imageTitleSpace = 8;
    
    self.placeholderBtn.requestImageSizeBlock = ^CGSize(CGSize originSize) {
        CGFloat w = weakSelf.height * 0.4;
        return CGSizeMake(w, w);
    };
    self.placeholderBtn.backgroundColor = CLEAR_COLOR;
    self.placeholderBtn.contentAlignment = NSButtonContentAlignmentCenter;
    self.placeholderBtn.userInteractionEnabled = NO;
    [self.searchTextFieldContentView addSubview:self.placeholderBtn];
    self.placeholderBtn.imageView.backgroundColor = RED_COLOR;
    self.placeholderBtn.titleLabel.backgroundColor = PURPLE_COLOR;
    _imageView = self.placeholderBtn.imageView;
    
//    _cancelButton = [YZHUIButton buttonWithType:UIButtonTypeCustom];
//    self.cancelButton.backgroundColor = RAND_COLOR;
//    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//    self.cancelButton.frame = CGRectZero;
//    [self addSubview:self.cancelButton];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self _updateSubViews];
}

-(void)setPlaceholder:(NSAttributedString *)placeholder
{
    [self.placeholderBtn setAttributedTitle:placeholder forState:UIControlStateNormal];
}

-(void)setSearchImage:(UIImage*)image
{
    [self.placeholderBtn setImage:image forState:UIControlStateNormal];
}

-(void)_updateSubViews
{
    CGFloat x = self.textFieldEdgeInsets.left;
    CGFloat y = self.textFieldEdgeInsets.top;
    CGFloat w = MAX(self.width - self.textFieldEdgeInsets.left - self.textFieldEdgeInsets.right, 0);
    CGFloat h = MAX(self.height - self.textFieldEdgeInsets.top - self.textFieldEdgeInsets.bottom, 0);
    self.searchTextFieldContentView.frame = CGRectMake(x, y, w, h);
    
    x = self.height * 0.4 + 8;
    self.inputTextField.frame = CGRectMake(x, 0, w - x, h);
    self.placeholderBtn.frame = self.searchTextFieldContentView.bounds;
}


-(void)_addNotification:(BOOL)add
{
    if (add) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didChangeText:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    }
}

-(void)_didBeginEditing:(NSNotification*)notification
{
    if (notification.object != self.inputTextField) {
        return;
    }
    [self _updateTextFieldSize:YES];
}

-(void)_didEndEditing:(NSNotification*)notification
{
    if (notification.object != self.inputTextField) {
        return;
    }
    [self _updateTextFieldSize:NO];
}

-(void)_didChangeText:(NSNotification*)notification
{
    if (notification.object != self.inputTextField) {
        return;
    }
    NSString *text = self.inputTextField.text;
    self.placeholderBtn.titleLabel.hidden = IS_AVAILABLE_NSSTRNG(text);
}

-(void)_updateTextFieldSize:(BOOL)active
{
    CGRect frame = self.inputTextField.frame;
    if (active) {
        self.placeholderBtn.contentAlignment = NSButtonContentAlignmentLeft;
        [self.placeholderBtn setNeedsLayout];
//        self.frame = self.frame;
//        self.placeholderBtn.frame = self.placeholderBtn.frame;
//        [self.cancelButton sizeToFit];
//        CGSize size = self.cancelButton.size;
//        CGFloat w = size.width;
//        CGFloat h = self.height;
//        CGFloat x = self.width - w - 2 * self.textFieldEdgeInsets.right;
//        self.cancelButton.frame = CGRectMake(x, 0, w, h);
//
//        self.inputTextField.frame = CGRectMake(frame.origin.x, frame.origin.y, self.cancelButton.left - self.textFieldEdgeInsets.left, frame.size.height);
    }
    else {
//        self.cancelButton.size = CGSizeZero;
//        [self _updateSubViewsSize];
        self.placeholderBtn.contentAlignment = NSButtonContentAlignmentCenter;
        [self.placeholderBtn setNeedsLayout];
    }
}

-(void)dealloc
{
    [self _addNotification:NO];
}


@end
