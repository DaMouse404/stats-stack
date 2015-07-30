install:

%:
	$(MAKE) $(*) -C statsite
	$(MAKE) $(*) -C influxdb
