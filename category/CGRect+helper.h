//
//  CGRect+helper.h
//  crmZztx
//
//  Created by niko on 10/14/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

static __inline__ CGRect CGRectFromSize( CGSize size ) {
    return CGRectMake( 0, 0, size.width, size.height );
};

static __inline__ CGRect CGRectMakeWithCenterAndSize( CGPoint center, CGSize size ) {
    return CGRectMake( center.x - size.width * 0.5, center.y - size.height * 0.5, size.width, size.height );
};

static __inline__ CGRect CGRectMakeWithOriginAndSize( CGPoint origin, CGSize size ) {
    return CGRectMake( origin.x, origin.y, size.width, size.height );
};

static __inline__ CGPoint CGRectCenter( CGRect rect ) {
    return CGPointMake( CGRectGetMidX( rect ), CGRectGetMidY( rect ) );
};