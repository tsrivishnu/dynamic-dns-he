
install:
	@echo "Updating crontab"
	@crontab -l > tempcron
	@echo "*/5 * * * * ($(PWD)/update-dns-ip.sh) >/dev/null 2>&1" >> tempcron
	@echo "@reboot ($(PWD)/update-dns-ip.sh) >/dev/null 2>&1" >> tempcron
	@crontab tempcron
	@rm tempcron
  	
	@echo "\r\n"
	@echo "Creating config file"
	@cp $(PWD)/config.example $(PWD)/config
	
	@echo "\r\n"
	@echo "Install complete. Edit +config+ file in $(PWD) to add your domain and password"
