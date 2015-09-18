program binread
  
  implicit none
  
! Define global parameters:
  integer,parameter                   :: GRID=256
 
  integer                             :: i,j,k,  fID, count
  real,allocatable,dimension(:,:,:)   :: temp 
  real,dimension(1:GRID,1:GRID,1:GRID):: u1_DNS ,u2_DNS, u3_DNS
  
  character*150 variableName, time,PATH

  variableName='Velocity'
  time = '0460'
  PATH = '/Users/Kshitij/Desktop/ALES/DNS_Data/'

!! Allocate the temp array
  allocate (temp(1:GRID,1:GRID,1:GRID))
  
!! Open direct access unformatted file with records sized for a single row.
!! CAUTION: The value of x is NOT divided by 100 
     
! open (unit=1,file='./Velocity1_0460.bin',form='unformatted', access='direct',&
!     convert='big_endian',recl=4)
! open (unit=2,file='./Velocity2_0460.bin',form='unformatted', access='direct',&
!       convert='big_endian',recl=4)
! open (unit=3,file='./Velocity3_0460.bin',form='unformatted', access='direct',&
!      convert='big_endian',recl=4)

!! READ DATA FROM BINARY FILES
do fID = 1,3

open(unit=fID, file = trim(PATH)//trim(variableName)//fID//'_'//trim(time)//'.bin', &
       status='old',form='unformatted',access='direct',convert='big_endian',recl=4)

    count = 0
    do k=1,GRID
       do j=1,GRID
          do i=1,GRID
             count = count+1
             read (fID,rec=count) temp(i,j,k)
          end do
       end do
    end do
    if (f.eq.1) u1_DNS = temp/100
    if (f.eq.2) u2_DNS = temp/100
    if (f.eq.3) u3_DNS = temp/100
    !write(*,*) i ,'', j , '' , k, '' ,temp(128,128,128)/100
  
close(fID)
end do

!Sanity Check: Compare with MATLAB
write(*,*) i ,'', j , '' , k, '' ,u1_DNS(128,128,128)/100 

deallocate (temp)

!! CALCULATE ENERGY E = 0.5*u_i*u_i

!! TAKE PRODUCTS


!close(1)
!close(2)
!close(3)
           
end program binread
 
