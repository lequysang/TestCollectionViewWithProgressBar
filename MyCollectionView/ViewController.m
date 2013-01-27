//
//  ViewController.m
//  MyCollectionView
//
//  Created by Quy Sang Le on 11/5/12.
//  Copyright (c) 2012 Quy Sang Le. All rights reserved.
//

#import "ViewController.h"
//#import "CollectionView.h"
#import "Cell.h"

@interface ViewController (){
    UICollectionView *firstCollectionView;
}
@property (strong , nonatomic) NSMutableArray *collectionData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.collectionData = [[NSMutableArray alloc]
                                         initWithObjects:
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                           @"http://img35.imageshack.us/img35/7614/screenshot20130127at102.png",
                                         nil];
//    self.collectionData = [[NSMutableArray alloc]
//                           initWithObjects:
//                           @"http://img827.imageshack.us/img827/9861/twitterkif.png",
//                           @"http://img217.imageshack.us/img217/3563/facebookrs.png",
//                           @"http://img543.imageshack.us/img543/934/youtubeno.png",
//                           @"http://img72.imageshack.us/img72/4080/bongdaso.png",
//                           @"http://img593.imageshack.us/img593/2112/vietnamnet.png",
//                           @"http://img546.imageshack.us/img546/5647/ngoisao.png",
//                           @"http://img41.imageshack.us/img41/2415/laodong.png",
//                           @"http://img521.imageshack.us/img521/6606/thanhnien.png",
//                           @"http://img89.imageshack.us/img89/8572/dantri.png",
//                           @"http://img507.imageshack.us/img507/7117/baomoi.png",
//                           @"http://img255.imageshack.us/img255/6673/tuoitre.png",
//                           @"http://img32.imageshack.us/img32/319/24h.png",
//                           @"http://img145.imageshack.us/img145/4453/vnexpress.png",
//                           nil];
    
    //applicationFrame
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    //Add Navigation Bar
    CGRect navBarFrame = [[UIScreen mainScreen] bounds];
    navBarFrame.size.height = 40.0f;
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:navBarFrame];
    //firstCollectionView
    CGRect firstCollectionFrame = appFrame;
    //collectionView frame size
    firstCollectionFrame.origin.x = 10.0f;
    firstCollectionFrame.origin.y = 60.0f;
    firstCollectionFrame.size.height = 400.f;
    firstCollectionFrame.size.width  = 300.0f;
    //collectionViewFlowLayout
    UICollectionViewFlowLayout *firstFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    firstFlowLayout.itemSize = CGSizeMake(300.0f, 57.0f);
    firstFlowLayout.minimumLineSpacing = 18.0f;
    firstFlowLayout.minimumInteritemSpacing = 20.0f;

    firstFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    firstCollectionView = [[UICollectionView alloc] initWithFrame:firstCollectionFrame collectionViewLayout:firstFlowLayout];
    [firstCollectionView setBackgroundColor:[UIColor clearColor]];
    [firstCollectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"FirstCell"];
     
    [firstCollectionView setDataSource:self];
    [firstCollectionView setDelegate:self];
    
    
    //addSubView
    [self.view addSubview:navBar];
    [self.view addSubview:firstCollectionView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionData count];;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FirstCell" forIndexPath:indexPath];
    
    NSString *downURL = [self.collectionData objectAtIndex:indexPath.row];
    
    [cell setDownString:downURL];
    
    return cell;
    
}





@end
