function Ex = EletricFieldX(xq,yq,q,xt,yt)
  %Função para encontrar as coordenadas x
  k = 10^10;
  modE = k*q./(((xt-xq).^2+(yq-yt).^2).^3/2);

  Ex = modE .*(xt-xq);


endfunction

