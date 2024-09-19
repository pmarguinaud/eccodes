#!/bin/sh

. ./include.ctest.sh

set -e
set -x

exec ${examples_dir}/eccodes_f_codes_get_real4_64 ${data_dir}/SURFZ0.FOIS.G___.grb 4
