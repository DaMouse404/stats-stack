VERSION := 2.1.0-pre1

RPM=grafana-${VERSION}.x86_64.rpm

install: ${RPM}
ifneq (,$(findstring {,$(shell cat custom.ini)))
	@echo "Looks like theres still some config to setup in ./grafana/custom.ini"
	@exit 1
endif
	sudo cp custom.ini /etc/grafana/grafana.ini
	sudo rpm -Uvh --replacepkgs ${RPM}

${RPM}:
	curl https://grafanarel.s3.amazonaws.com/builds/${RPM} -o ${RPM}

yum:
	sudo yum install -y initscripts fontconfig

clean:
	rm -f ${RPM}
