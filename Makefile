all: grafana/grafana-plugins-master

grafana/grafana-plugins-master: grafana/master.zip
	unzip $< -d grafana

grafana/master.zip:
	wget https://github.com/grafana/grafana-plugins/archive/master.zip -P `dirname $@`

clean:
	-rm -R grafana/master.zip
	-rm -R grafana/grafana-plugins-master

