#!/bin/sh
# (C) Copyright 2005- ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
#
# In applying this licence, ECMWF does not waive the privileges and immunities granted to it by
# virtue of its status as an intergovernmental organisation nor does it submit to any jurisdiction.
#

. ./include.ctest.sh

label="ioutr"
temp=temp.$label.txt

if [ $ECCODES_ON_WINDOWS -eq 1 ]; then
    echo "$0: This test is currently disabled on Windows"
    exit 0
fi

mkdir -p extra_grib_defs/grib2/localConcepts/lfpw

cat > extra_grib_defs/grib2/localConcepts/lfpw/faModelName.def << EOF
'arome-pifrance-production-oper-fc'         = { generatingProcessIdentifier = 62; indicatorOfUnitOfTimeRange = "m"; }
EOF

cat > extra_grib_defs/grib2/localConcepts/lfpw/faFieldName.def << EOF
"SURFFLU.RAY.SOLA" = {
    discipline = 0 ;
    parameterCategory = 4 ;
    parameterNumber = 9 ;
    productDefinitionTemplateNumber = 8 ;
    tablesVersion = 15 ; 
    typeOfFirstFixedSurface = 1 ;
    typeOfStatisticalProcessing = 1 ;
    scaledValueOfFirstFixedSurface = 0 ;
    LSTCUM = 1 ;
}
EOF

export ECCODES_DEFINITION_PATH=$PWD/extra_grib_defs:$ECCODES_DEFINITION_PATH

$EXEC ${test_dir}/ioutr

