//
//  ViewController.m
//  MapKitTest
//
//  Created by Woncheol on 2017. 3. 7..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"

static const CGFloat BASE_LITITUDE = 37.534676;
static const CGFloat BASE_LONGITUDE = 126.866491;


@interface ViewController ()
<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapViewTest;
@property CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(BASE_LITITUDE, BASE_LONGITUDE);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    [self.mapViewTest setRegion:region];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    [self.mapViewTest setShowsUserLocation:YES];
    
    Annotation *anno = [[Annotation alloc] init];
    [anno setCoordinate:coordinate];
    
    [self.mapViewTest addAnnotation:anno];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"locationManager");
    CLLocationCoordinate2D newCoordinate = ((CLLocation*)locations.lastObject).coordinate;
    MKCoordinateSpan newSpan = MKCoordinateSpanMake(0.1, 0.1);
    
    MKCoordinateRegion newRegion = MKCoordinateRegionMake(newCoordinate, newSpan);
    [self.mapViewTest setRegion:newRegion];
    
    [manager stopUpdatingLocation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
