program DNS
  
  implicit none
  
  integer,parameter:: GRID=256
  integer,parameter :: m = GRID, n = GRID, p = GRID
  integer ::i,j,k,f,count
  real,allocatable,dimension(:,:,:):: temp , u1_DNS ,u2_DNS, u3_DNS

  allocate (temp(1:m,1:n,1:p))
  allocate (u1_DNS(1:m,1:n,1:p))
  allocate (u2_DNS(1:m,1:n,1:p))
  allocate (u3_DNS(1:m,1:n,1:p))
  
!! Open direct access unformatted file with records sized for a single row.

  
!! CAUTION: The value of x is NOT divided by 100 
     
 open (unit=1,file='./Velocity1_0460.bin',form='unformatted', access='direct',&
      convert='big_endian',recl=4)
 open (unit=2,file='./Velocity2_0460.bin',form='unformatted', access='direct',&
       convert='big_endian',recl=4)
 open (unit=3,file='./Velocity3_0460.bin',form='unformatted', access='direct',&
      convert='big_endian',recl=4)

!! READ DATA FROM BINARY FILES
do f = 1,3
    count = 0
    do k=1,p
       do j=1,n
          do i=1,m
             count = count+1
             read (f,rec=count) temp(i,j,k)
          end do
       end do
    end do
    if (f.eq.1) u1_DNS = temp/100
    if (f.eq.2) u2_DNS = temp/100
    if (f.eq.3) u3_DNS = temp/100
    write(*,*) i ,'', j , '' , k, '' ,temp(128,128,128)/100
end do

deallocate (temp)

!! CALCULATE ENERGY E = 0.5*u_i*u_i

!! TAKE PRODUCTS


close(1)
close(2)
close(3)
           
end program DNS
 
