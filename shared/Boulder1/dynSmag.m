function [tau_f1,tau_f2]=dynSmag(var_f1,var_f2,filt2,delt1,delt2,...
                                 Sij_f1,Sij_f2,S_f1,S_f2,nx)

tn =[1,1;1,2;1,3;2,2;2,3;3,3];
Lij=zeros(6,nx(1),nx(2),nx(3));
Mij=zeros(6,nx(1),nx(2),nx(3));
for ij=1:6
    Lij(ij,:,:,:)=spectralFilter3D(squeeze(var_f1(tn(ij,1),:,:,:).* ...
                                    var_f1(tn(ij,2),:,:,:)),filt2)- ...
                                   squeeze(var_f2(tn(ij,1),:,:,:).* ... 
                                           var_f2(tn(ij,2),:,:,:));
    Mij(ij,:,:,:)=2*delt1^2*spectralFilter3D(S_f1.* ...
                   squeeze(Sij_f1(tn(ij,1),tn(ij,2),:,:,:)),filt2)- ...
                (2*delt2^2*S_f2.*squeeze(Sij_f2(tn(ij,1),tn(ij,2),:,:,:)));
end

%cs^2=M_ij*L_ij/M_kl*M_kl
cs2=squeeze((  Mij(1,:,:,:).*Lij(1,:,:,:)+ ...
     2*Mij(2,:,:,:).*Lij(2,:,:,:)+ ...
     2*Mij(3,:,:,:).*Lij(3,:,:,:)+ ...
       Mij(4,:,:,:).*Lij(4,:,:,:)+ ...
     2*Mij(5,:,:,:).*Lij(5,:,:,:)+ ...
       Mij(6,:,:,:).*Lij(6,:,:,:) )./...
    (  Mij(1,:,:,:).*Mij(1,:,:,:)+ ...
     2*Mij(2,:,:,:).*Mij(2,:,:,:)+ ...
     2*Mij(3,:,:,:).*Mij(3,:,:,:)+ ...
       Mij(4,:,:,:).*Mij(4,:,:,:)+ ...
     2*Mij(5,:,:,:).*Mij(5,:,:,:)+ ...
       Mij(6,:,:,:).*Mij(6,:,:,:) ));
   
%LES and test scale stresses
tau_f1=zeros(6,nx(1),nx(2),nx(3));
tau_f2=zeros(6,nx(1),nx(2),nx(3));
for ij=1:6
    tau_f1(ij,:,:,:)=-2*delt1^2*cs2.*S_f1.* ... 
                                  squeeze(Sij_f1(tn(ij,1),tn(ij,2),:,:,:));
    tau_f2(ij,:,:,:)=-2*delt2^2*cs2.*S_f2.* ... 
                                  squeeze(Sij_f2(tn(ij,1),tn(ij,2),:,:,:));
end


end