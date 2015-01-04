//
//  CGRect+helper.h
//  crmZztx
//
//  Created by niko on 10/14/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

CG_INLINE CGRect CGRectFromSize( CGSize size ) {
    return CGRectMake( 0, 0, size.width, size.height );
};

CG_INLINE CGRect CGRectMakeWithCenterAndSize( CGPoint center, CGSize size ) {
    return CGRectMake( center.x - size.width * 0.5, center.y - size.height * 0.5, size.width, size.height );
};

CG_INLINE CGRect CGRectMakeWithOriginAndSize( CGPoint origin, CGSize size ) {
    return CGRectMake( origin.x, origin.y, size.width, size.height );
};

CG_INLINE CGPoint CGRectCenter( CGRect rect ) {
    return CGPointMake( CGRectGetMidX( rect ), CGRectGetMidY( rect ) );
};