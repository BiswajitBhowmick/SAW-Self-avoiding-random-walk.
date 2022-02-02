      integer steps,i,j,iter
      integer x,y, rand_x, rand_y,l
      real distance_sq, generator
      real distance_sq_sum, rms
      integer row, col, dx,dy
      integer grid(10000,10000) !defining the 2d lattice for walk
      integer c(10000),check_step

c Initializing values:
      rms=0.0
      distance_sq_sum=0.0
      distance_sq=0.0
      row=1000
      col=1000
      check_step=0

      do i=1, row
        do j=1, col
            grid(i,j)=0
        enddo
      enddo


c Taking input values:
      write(*,*)'Enter the total number of steps:'
      read(*,*) steps ! total #s of steps
      write(*,*) 'Enter the step length'
      read(*,*) l ! # step size
  !    write(*,*) 'Enter the number of iterations'
   !   read(*,*) iter !# of loops
      write(*,*) ' Initial coordinates (x,y) one after another:'
      read(*,*) x, y ! Initial coordinates assignment

c Copying initial coordinates to another variable for further analysis:
      rand_x=x+(row)/2
      rand_y=y+(col)/2


      grid(rand_x,rand_y)=1 !intial position

      do while(steps.ne.0)

10      generator= rand()  !direction
c====================================================================
        if(grid(rand_x+l,rand_y).eq.0 .and.generator.ge.0.0
     & .and. generator .le. 0.25) then
          rand_x=rand_x+l
         grid(rand_x,rand_y)=1
         steps=steps-1
        print*,"+x: Final coordinates (x,y):"
     &  ,rand_x-x-(row)/2,rand_y-y-(col)/2
         endif
c====================================================================
        if(grid(rand_x,rand_y+l).eq.0 .and.generator.gt.0.25
     & .and. generator .lt. 0.5 ) then
         rand_y=rand_y+l
         grid(rand_x,rand_y)=1
          steps=steps-1
      print*,"+y: Final coordinates (x,y):"
     &  ,rand_x-x-(row)/2,rand_y-y-(col)/2
         endif
c====================================================================
        if(grid(rand_x-l,rand_y).eq.0 .and. generator.gt.0.5
     & .and. generator .lt. 0.75 ) then
        rand_x=rand_x-l
        grid(rand_x,rand_y)=1
         steps=steps-1
         print*,"-x: Final coordinates (x,y):"
     &  ,rand_x-x-(row)/2,rand_y-y-(col)/2
         endif
c====================================================================

         if(grid(rand_x,rand_y-l).eq.0 .and. generator.gt.0.75
     & .and. generator .le. 1.0 ) then
         rand_y=rand_y-l
        grid(rand_x,rand_y)=1
         steps=steps-1
       print*,"-y: Final coordinates (x,y):"
     &  ,rand_x-x-(row)/2,rand_y-y-(col)/2
         endif
c====================================================================

         enddo



      stop
      end



