default.autofs[:maps] = {'/net' => {:source=>'-hosts',:opts=>'-fstype=nfs,tcp,mountproto=tcp,soft,intr,rsize=8192,wsize=8192,nolock'} }
