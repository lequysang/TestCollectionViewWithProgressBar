//
//  Cell.h
//  MyCollectionView
//
//  Created by Quy Sang Le on 11/5/12.
//  Copyright (c) 2012 Quy Sang Le. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell

@property (strong , nonatomic) UIImageView *imageView;

@property (strong,nonatomic) UIProgressView *downloadBar;
@property (nonatomic,strong) NSMutableData *receivedData;

@property (nonatomic) CGFloat barSize;

@property(strong,nonatomic) NSString *downString;
-(void)setDownString:(NSString *)downString;

@end
