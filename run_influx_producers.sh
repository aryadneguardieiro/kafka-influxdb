DURATION=$1

echo "Running config_client_metrics";
timeout "$DURATION"m python3 -m kafka_influxdb -c config_client_metrics.yaml &
echo "Running config_estimate_sla_sro";
timeout "$DURATION"m python3 -m kafka_influxdb -c config_estimate_sla_sro.yaml &
echo "Running config_loadgen_metrics.yaml"
timeout "$DURATION"m python3 -m kafka_influxdb -c config_loadgen_metrics.yaml &
echo "Running config_selected_metrics.yaml"
timeout "$DURATION"m python3 -m kafka_influxdb -c config_selected_metrics.yaml &
echo "Done"
