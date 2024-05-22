[vm]
%{ for ip in db_servers ~}
${ip}
%{ endfor ~}

