  $ OCAMLRUNPARAM=b niagara --test ../examples/opposition.nga <<EOF
  > 1: rbd += 100000$
  > EOF
  Awaiting inputs:
  ### OUTPUTS ###
  1: ++ no events:
       - rbd { 400000., 400000. }:
         160000. -> distrib
         default 240000. -> rnc
       - rnc { 240000., 240000. }:
         240000. -> distrib[frais]
       - distrib { 400000., 400000. }:
         - distrib[frais] { 240000., 240000. }:
         
       
     ++ after event recup_frais :
       - rbd { 9600000., 10000000. }:
         3840000. -> distrib
         default 5760000. -> rnc
       - rnc { 5760000., 6000000. }:
         default 5760000. -> rnpp
       - rnpp { 5760000., 5760000. }:
         1152000. -> sofica[recup]
         default 4608000. -> prod[residuel]
       - distrib { 3840000., 4240000. }:
         
       - prod { 4608000., 4608000. }:
         - prod[residuel] { 4608000., 4608000. }:
         
       - sofica { 1152000., 1152000. }:
         - sofica[recup] { 1152000., 1152000. }:
         
       
     
  $ OCAMLRUNPARAM=b niagara --test ../examples/opposition.nga --for sofica <<EOF
  > 1: rbd += 100000$
  > EOF
  Awaiting inputs:
  ### OUTPUTS ###
  1: ++ no events:
       - rbd { 300000., 300000. }:
       - rnc @sofica { 240000., 240000. }:
         240000. -> distrib[frais] @sofica
       - distrib[frais] @sofica { 240000., 240000. }:
       
     ++ after event recup_frais @sofica :
       - rbd { 7500000., 7800000. }:
       - rnc @sofica { 6000000., 6240000. }:
         default 6000000. -> rnpp @sofica
       - rnpp @sofica { 6000000., 6000000. }:
         1200000. -> sofica[recup] @sofica
       - sofica @sofica { 1200000., 1200000. }:
         - sofica[recup] @sofica { 1200000., 1200000. }:
         
       
     ++ after event recup_sofica @sofica :
       - rbd { 2200000., 10000000. }:
       - rnc @sofica { 1760000., 8000000. }:
         default 1760000. -> rnpp @sofica
       - rnpp @sofica { 1760000., 7760000. }:
         88000. -> sofica[residuel] @sofica
       - sofica @sofica { 88000., 1288000. }:
         - sofica[residuel] @sofica { 88000., 88000. }:
         
       
     
