sudo systemctl restart prometheus
# or
pkill prometheus && prometheus --config.file=prometheus.yml &
