#!/bin/sh

#  CopyGoogleServiceInfo.sh
#  FirebaseSampleCodeForUIKit
#
#  Created by Shusuke Ota on 2021/6/6.
#  Copyright © 2021 shusuke. All rights reserved.

GOOGLE_SERVICE_INFO_PLIST_PATH=${PROJECT_DIR}/${PROJECT_NAME}/Plist/Firebase

case "${CONFIGURATION}" in
    "Product")
        cp -r "$GOOGLE_SERVICE_INFO_PLIST_PATH/GoogleService-Info-Product.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
        echo "Firease: GoogleService-Info-Product.plist copied"
        ;;
    "Staging")
        cp -r "$GOOGLE_SERVICE_INFO_PLIST_PATH/GoogleService-Info-Staging.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
        echo "Firease: GoogleService-Info-Staging.plist copied"
        ;;
    *)
        echo "Firebase: [NG] GoogleService-Info did not copied. Because this CONFIGURATION is not found"
        ;;
esac
