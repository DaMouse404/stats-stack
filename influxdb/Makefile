VERSION := 0.9.2

RPM=influxdb-${VERSION}-1.x86_64.rpm

install: ${RPM}
	sudo rpm -Uvh --replacepkgs ${RPM}

${RPM}:
	curl https://s3.amazonaws.com/influxdb/${RPM} -o ${RPM}

clean:
	rm -f ${RPM}
