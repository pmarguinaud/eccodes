program codes_get_real4_64

use eccodes

implicit none

integer :: fh
integer :: gh
integer :: i

real(kind=8), allocatable :: values8 (:)
real(kind=4), allocatable :: values4 (:)

integer(kind=4) :: isize

character*256 :: clfile
character*32 :: clk
integer :: ik

call getarg (1, clfile)
call getarg (2, clk); read (clk, *) ik
 
call codes_open_file (fh, trim (clfile), 'r')
call codes_grib_new_from_file (fh, gh)

call codes_get_size (gh,'values', isize)

print*, 'isize = ', isize

if (ik == 8) then
  allocate (values8(isize))
  call codes_get (gh, 'values', values8)
  print *, "REAL8"
  do i = 1, isize, 1000
    write (*, '(I8," ",E30.20)') i, values8 (i)
  enddo
  write (*, '(2E30.20)') minval (values8), maxval (values8)
elseif (ik == 4) then
  allocate (values4(isize))
  call codes_get (gh, 'values', values4)
  print *, "REAL4"
  do i = 1, isize, 1000
    write (*, '(I8," ",E30.20)') i, values4 (i)
  enddo
  write (*, '(2E30.20)') minval (values4), maxval (values4)
endif

call codes_release (gh)
call codes_close_file (fh)

end 

