USE eccodes

INTEGER :: IGRIBH
CHARACTER(LEN=17) :: CLNOMA1, CLNOMA2
INTEGER(KIND=8) IMULTM, IMULTE


CALL codes_grib_new_from_samples(IGRIBH, "regular_ll_sfc_grib2")

! set centre to MeteoFrance and use their local definition
CALL codes_set(IGRIBH, 'centre', 85)
CALL codes_set(IGRIBH, 'grib2LocalSectionPresent', 1)
CALL codes_set(IGRIBH, 'grib2LocalSectionNumber', 1)

CLNOMA1 = 'SURFNEBUL.TOTALE'
CALL codes_set_string(IGRIBH, 'faFieldName', CLNOMA1)
!CALL codes_get_string(IGRIBH, 'faFieldName', CLNOMA2)

CALL codes_get (IGRIBH, 'FMULTE', IMULTE)

PRINT *, " CLNOMA1 = ", CLNOMA1
!PRINT *, " CLNOMA2 = ", CLNOMA2
PRINT *, " IMULTE  = ", IMULTE

!IF (CLNOMA1 /= CLNOMA2) STOP 1

END
