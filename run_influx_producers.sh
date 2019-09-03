DURATION=$1
SCRIPT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Running config_client_metrics";
timeout "$DURATION"m python3 -m kafka_influxdb -c SCRIPT_PATH/config_client_metrics.yaml &
echo "Running config_estimate_sla_sro";
timeout "$DURATION"m python3 -m kafka_influxdb -c SCRIPT_PATH/config_estimate_sla_sro.yaml &
echo "Running config_loadgen_metrics.yaml"
timeout "$DURATION"m python3 -m kafka_influxdb -c SCRIPT_PATH/config_loadgen_metrics.yaml &
echo "Running config_selected_metrics.yaml"
timeout "$DURATION"m python3 -m kafka_influxdb -c SCRIPT_PATH/config_selected_metrics.yaml &
echo "Done"
