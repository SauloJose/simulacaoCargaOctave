function Ex = EletricFieldX(xq,yq,q,xt,yt)
  %Função para encontrar as coordenadas x
  k = 10^10;
  modE = k*q./(distance2d(xq,yq,xt,yt)^3);

  Ex = modE .*(xt-xq);


endfunction

