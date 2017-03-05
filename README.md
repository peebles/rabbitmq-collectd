# RabbitMQ CollectD

This is a simple container for running the rabbitmq collectd plugin.

Its on Dockerhub:

    docker pull aqpeeb/rabbitmq-collectd

## Usage in a docker-compose file

```yaml
rabbitmq:
  image: rabbitmq
  container_name: rabbitmq
  environment:
    RABBITMQ_DEFAULT_USER: admin
    RABBITMQ_DEFAULT_PASS: secret

rabbitmq-collectd:
  image: aqpeeb/rabbitmq-collectd
  container_name: rabbitmq-collectd
  links:
    - graphite
    - rabbitmq
  environment:
    GRAPHITE_HOST: graphite
    RABBITMQ_HOST: rabbitmq
    RABBITMQ_USERNAME: admin
    RABBITMQ_PASSWORD: secret
```

