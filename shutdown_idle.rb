#!/usr/bin/ruby

idle_count = 0
while idle_count < 10
  num = `sudo netstat -tnpa | grep 'ESTABLISHED.*sshd' | wc -l`

  if(num.to_i > 0) then idle_count = 0
  else idle_count = idle_count + 1
  end

  sleep 300 # 5 minutes
end


# Had too many idle attempts in a row, shutting down
`sudo shutdown -h now`
