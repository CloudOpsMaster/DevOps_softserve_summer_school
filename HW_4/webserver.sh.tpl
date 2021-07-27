#!/bin/bash
sudo apt update
sudo apt install apache2

cat <<EOF >/var/wwww/html/index.html
<html>
<h2>WebServer Build by Terraform for SoftServe! </h2>
Owner ${f_name} ${l_name}

%{ for x in names }
Hello to ${x}  <br>
%{ endfor }
</html>

EOF

sudo service apache2 start



