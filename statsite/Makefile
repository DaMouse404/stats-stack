VERSION := master
RPMVERSION := 0.7.1

SOURCEDIR = statsite-${VERSION}
SOURCEBALL = ${VERSION}.tar.gz

install: users
	sudo rpm -i ${SOURCEDIR}/rpm-build/statsite-${RPMVERSION}-1.el6.x86_64.rpm
	sudo cp influxdb.ini /etc/statsite
	sudo cp statsite.conf /etc/statsite

build: ${SOURCEDIR}
	cd ${SOURCEDIR} && $(MAKE) rpms

yum:
	sudo yum install -y --enablerepo=epel scons monit check-devel

users:
	getent group statsite >/dev/null || sudo groupadd -r statsite
	getent passwd statsite >/dev/null || \
		sudo useradd -r -g statsite -s /sbin/nologin \
		-d /usr/libexec/statsite -c "Statsite" statsite

${SOURCEDIR}:
	curl -L https://github.com/armon/statsite/archive/${SOURCEBALL} -o ${SOURCEBALL}
	tar zxf ${SOURCEBALL}

clean:
	rm -rf ${SOURCEDIR}
	rm -f ${SOURCEBALL}
