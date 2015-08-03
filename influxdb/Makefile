VERSION := 0.9.2

RPM=influxdb-${VERSION}-1.x86_64.rpm

install: ${RPM}
	sudo rpm -Uvh --replacepkgs ${RPM}

${RPM}:
	curl https://s3.amazonaws.com/influxdb/${RPM} -o ${RPM}

database:
	curl -G 'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE statsite"
	curl -G 'http://localhost:8086/query' --data-urlencode "q=CREATE USER statsite WITH PASSWORD 'st4ts1t3'"
	curl -G 'http://localhost:8086/query' --data-urlencode "q=GRANT ALL ON statsite TO statsite"

clean:
	rm -f ${RPM}
