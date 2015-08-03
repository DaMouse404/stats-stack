install:

%:
	$(MAKE) $(*) -C statsite
	$(MAKE) $(*) -C influxdb
	$(MAKE) $(*) -C nginx
	$(MAKE) $(*) -C grafana
