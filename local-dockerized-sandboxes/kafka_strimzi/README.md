# Kafka STRIMZI for K8s

- I used the quick start: https://strimzi.io/quickstarts/
- then used the TDS from SoSOA as a base for the Dockerfile, trimming it down. 
- main.py uses faust-streaming (forked version of faust) to comm with kafka on k8s

To start:

- build a local image
  - `docker build . -t kafka-producer:test`
- In a separate terminal, run a consumer:
  - `kubectl -n kafka run kafka-producer -ti --image=quay.io/strimzi/kafka:0.34.0-kafka-3.4.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic my-topic`
- In a separate terminal, run a producer:
  - `kubectl -n kafka run kafka-producer -ti --image=kafka-producer:test --rm=true --restart=Never`
