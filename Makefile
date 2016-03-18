all: grafana/grafana-plugins-master bosun/bin/bosun bosun/bin/scollector

grafana/grafana-plugins-master: grafana/master.zip
	unzip $< -d grafana

grafana/master.zip:
	wget https://github.com/grafana/grafana-plugins/archive/master.zip -P `dirname $@`

bosun/bin/scollector:
	GOPATH=`pwd`/bosun go get bosun.org/cmd/scollector

bosun/bin/bosun:
	GOPATH=`pwd`/bosun go get bosun.org/cmd/bosun

clean:
	-rm -R grafana/master.zip
	-rm -R grafana/grafana-plugins-master
	-rm -fR bosun/bin bosun/pkg bosun/src

run_bosun:
	./bosun/bin/bosun -c bosun/bosun.conf

run_scollector:
	./bosun/bin/scollector -h localhost:8070 -d


