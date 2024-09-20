USE eccodes

INTEGER :: IGRIBH
CHARACTER(LEN=17) :: CLNOMA1, CLNOMA2
INTEGER(KIND=8) IMULTM, IMULTE


CALL codes_grib_new_from_samples(IGRIBH, "regular_ll_sfc_grib2")


CALL codes_SET_LONG (IGRIBH, "centre", 85_8 )
CALL codes_SET_INT (IGRIBH, "grib2LocalSectionPresent", 1 )
CALL codes_SET_LONG (IGRIBH, "grib2LocalSectionNumber", 1_8 )
CALL codes_SET_LONG (IGRIBH, "typeOfGeneratingProcess", 2_8 )
CALL codes_SET_LONG (IGRIBH, "typeOfProcessedData", 1_8 )
CALL codes_SET_STRING (IGRIBH, "faFieldName", "SURFNEBUL.TOTALE")


CALL codes_get (IGRIBH, 'FMULTE', IMULTE)

PRINT *, " IMULTE  = ", IMULTE

END
