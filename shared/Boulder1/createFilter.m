function filt=createFilter(nx,nxc,fc)

filt=zeros(nx);
for i=1:nx(1)
    for j=1:nx(2)
        for k=1:nx(3)
            if (sqrt((i-nxc(1))^2+(j-nxc(2))^2+(k-nxc(3))^2)<=fc)
                filt(i,j,k)=1;
            end
        end
    end
end

end