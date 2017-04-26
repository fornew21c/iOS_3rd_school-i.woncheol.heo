//
//  DetailViewController.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 11..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "DetailViewController.h"
#import "DataCenter.h"
#import "HeaderCollectionViewCell.h"
#import "InsertViewController.h"
#import "SubCustomTableViewCell.h"
#import <Mapbox/Mapbox.h>



@import Firebase;

//typedef NSString * (^NotiIndexBloc) (NSString *noitText);
@interface DetailViewController ()
<UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching, MGLMapViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
//@property NotiIndexBloc notiString;
@property NSArray *number;
//@property 
@property (nonatomic, weak) IBOutlet UICollectionView *imgCollection;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIView *mapBottom;
@property NSMutableArray *profileArray;

@property (nonatomic) MGLMapView *mapView;

@property (nonatomic) UIActivityIndicatorView *indicator;
@property (nonatomic, weak) UIView *bottomView;

@property BOOL indicatorState;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.number = @[@"1", @"2", @"3"];

//    [self collectionImg];
    
    [self.myHeaderView insertDataSetIndex:self.indexPath.row];
    
    self.addButton.tag = 1;
//    [self.detailTableView setFrame:CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor lightGrayColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [self.detailTableView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    self.mapView.delegate = self;
    [self mapViewCreat];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    UIView *bottomView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.indicator.center = CGPointMake(bottomView.frame.size.width/2, bottomView.frame.size.height/2-50);
    self.bottomView = bottomView;
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.alpha = 0.7;
    bottomView.userInteractionEnabled = NO;
    [self.detailTableView addSubview:bottomView];
    [bottomView addSubview:self.indicator];
    [self.indicator startAnimating];
    [self addObseverAction];
    self.indicatorState = YES;
    
}

- (void)addObseverAction{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(indicatorAction:) name:@"stopIndicateOftable" object:nil];
}

- (void)indicatorAction:(NSNotification *)sender{
    
    
    [self.indicator stopAnimating];
    [self.bottomView removeFromSuperview];
    [self.detailTableView reloadData];
}


- (void)mapViewCreat{
    
    self.mapView = [[MGLMapView alloc] initWithFrame:self.mapBottom.bounds];
    self.mapView.styleURL = [MGLStyle satelliteStyleURLWithVersion:9];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Set the map's center coordinate
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(33.450774, 126.924878)
                            zoomLevel:12
                             animated:NO];
    
    [self.mapBottom addSubview:self.mapView];
    
    // Set the delegate property of our map view to self after instantiating it.
    
    
    [self drawPolyline];
    
}

- (void)drawPolyline {
    // Perform GeoJSON parsing on a background thread
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(backgroundQueue, ^(void)
                   {
                       // Get the path for example.geojson in the app's bundle
                       NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"geojson"];
                       
                       // Load and serialize the GeoJSON into a dictionary filled with properly-typed objects
                       NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:jsonPath] options:0 error:nil];
                       
                       // Load the `features` dictionary for iteration
                       for (NSDictionary *feature in jsonDict[@"features"])
                       {
                           // Our GeoJSON only has one feature: a line string
                           if ([feature[@"geometry"][@"type"] isEqualToString:@"LineString"])
                           {
                               // Get the raw array of coordinates for our line
                               NSArray *rawCoordinates = feature[@"geometry"][@"coordinates"];
                               NSUInteger coordinatesCount = rawCoordinates.count;
                               
                               // Create a coordinates array, sized to fit all of the coordinates in the line.
                               // This array will hold the properly formatted coordinates for our MGLPolyline.
                               CLLocationCoordinate2D coordinates[coordinatesCount];
                               
                               // Iterate over `rawCoordinates` once for each coordinate on the line
                               for (NSUInteger index = 0; index < coordinatesCount; index++)
                               {
                                   // Get the individual coordinate for this index
                                   NSArray *point = [rawCoordinates objectAtIndex:index];
                                   
                                   // GeoJSON is "longitude, latitude" order, but we need the opposite
                                   CLLocationDegrees lat = [[point objectAtIndex:1] doubleValue];
                                   CLLocationDegrees lng = [[point objectAtIndex:0] doubleValue];
                                   CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lng);
                                   
                                   // Add this formatted coordinate to the final coordinates array at the same index
                                   coordinates[index] = coordinate;
                               }
                               
                               // Create our polyline with the formatted coordinates array
                               MGLPolyline *polyline = [MGLPolyline polylineWithCoordinates:coordinates count:coordinatesCount];
                               
                               // Optionally set the title of the polyline, which can be used for:
                               //  - Callout view
                               //  - Object identification
                               // In this case, set it to the name included in the GeoJSON
                               polyline.title = feature[@"properties"][@"name"]; // "Crema to Council Crest"
                               
                               // Add the polyline to the map, back on the main thread
                               // Use weak reference to self to prevent retain cycle
                               __weak typeof(self) weakSelf = self;
                               dispatch_async(dispatch_get_main_queue(), ^(void)
                                              {
                                                  [weakSelf.mapView addAnnotation:polyline];
                                              });
                           }
                       }
                       
                   });
}

- (CGFloat)mapView:(MGLMapView *)mapView alphaForShapeAnnotation:(MGLShape *)annotation {
    // Set the alpha for all shape annotations to 1 (full opacity)
    return 1.0f;
}

- (CGFloat)mapView:(MGLMapView *)mapView lineWidthForPolylineAnnotation:(MGLPolyline *)annotation {
    // Set the line width for polyline annotations
    return 2.0f;
}

- (UIColor *)mapView:(MGLMapView *)mapView strokeColorForShapeAnnotation:(MGLShape *)annotation {
    // Set the stroke color for shape annotations
    // ... but give our polyline a unique color by checking for its `title` property
    if ([annotation.title isEqualToString:@"Crema to Council Crest"]) {
        // Mapbox cyan
        return [UIColor colorWithRed:59.0f/255.0f green:178.0f/255.0f blue:208.0f/255.0f alpha:1.0f];
    } else {
        return [UIColor redColor];
    }
}



- (void)refreshData{
    
    UITableViewController *tableViewController = [[UITableViewController alloc] init];
    tableViewController.tableView = self.detailTableView;
    [self.detailTableView reloadData];
    [tableViewController.refreshControl endRefreshing];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    UIView *bottomView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.indicator.center = CGPointMake(bottomView.frame.size.width/2, bottomView.frame.size.height/2-50);
    self.bottomView = bottomView;
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.alpha = 0.7;
    bottomView.userInteractionEnabled = NO;
    
    [self.detailTableView addSubview:bottomView];
    [bottomView addSubview:self.indicator];
    
    
    [self.indicator startAnimating];
    [self addObseverAction];
    self.indicatorState = YES;
    
    ////////
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(queue, ^{
        [[DataCenter shareData] replyCreateSetWebID:self.indexPath.row];
    });
    
    
    while (self.indicatorState == NO) {
        sleep(12);
        [self.indicator stopAnimating];
        [bottomView removeFromSuperview];
        self.indicatorState = NO;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[DataCenter shareData] replySearch].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SubCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID" forIndexPath:indexPath];
    
//    NSMutableArray *replyArray = [[NSMutableArray alloc] init];
    
    
    cell.anoymityLB.text = [[[DataCenter shareData] replySearch][indexPath.row] objectForKey:@"anomity"];
    cell.replyLB.text = [[[DataCenter shareData] replySearch][indexPath.row] objectForKey:@"mainText"];
//    cell.smallProfile.image
    UIImage *profileImgStr = [[[DataCenter shareData] replySearch][indexPath.row] objectForKey:@"profileImg"];
//    NSURL *profileImgUrl = [NSURL URLWithString:profileImgStr];
//    NSData *profileImgData = [NSData dataWithContentsOfURL:profileImgUrl];
//    UIImage *proflieImg = [UIImage imageWithData:profileImgData];
//    NSMutableArray *profileArray = [[NSMutableArray alloc] init];
//    self.profileArray = profileArray;
//    [profileArray addObject:proflieImg];
    cell.smallProfile.image = profileImgStr;
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger temp = self.indexPath.row;
    return [[[[DataCenter shareData] specificWebID:temp] objectForKey:@"collectionImg"] count];;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.layer.cornerRadius = 10.0;
    NSInteger temp = self.indexPath.row;
    
    [[[[DataCenter shareData] specificWebID:temp] objectForKey:@"collectionImg"] objectAtIndex:indexPath.item];
    cell.imageView.image = [UIImage imageWithData:[[[[DataCenter shareData] specificWebID:temp] objectForKey:@"collectionImg"] objectAtIndex:indexPath.item]];
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
//    indexPaths
    
}

- (IBAction)addButtonAction:(UIButton *)sender {
    if (sender.tag == 1) {
        InsertViewController *insertVC = [self.storyboard instantiateViewControllerWithIdentifier:@"InsertViewController"];
        insertVC.indexPath = self.indexPath.row;
        [self.navigationController pushViewController:insertVC animated:YES];
        
    }
}


-(void)viewDidLayoutSubviews{
    
    
}

-  (void)awakeFromNib{
    [super awakeFromNib];
//    self.detailTableView.frame.origin = CGPointMake(-40, 0);
    
//    [self drawPolyline]
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
