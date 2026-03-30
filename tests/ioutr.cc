#include <eccodes.h>

int main (int argc, char * argv[])
{
  grib_handle * h = NULL;
  long int ioutr1, ioutr2;

  h = grib_handle_new_from_samples (NULL, "regular_ll_pl_grib2");

  grib_set_long (h, "indicatorOfUnitOfTimeRange", 0);

  grib_get_long (h, "indicatorOfUnitOfTimeRange", &ioutr1);
  printf (" ioutr = %d\n", ioutr1);

  grib_set_long (h, "productDefinitionTemplateNumber", 8);

  grib_get_long (h, "indicatorOfUnitOfTimeRange", &ioutr2);
  printf (" ioutr = %d\n", ioutr2);

  if (ioutr1 != ioutr2)
    abort ();

  return 0;
}
