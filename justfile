setup:
    evcxr_jupyter --install
    podman machine init
    podman machine set --rootful
    podman machine start

engine http_proxy=env_var("HTTP_PROXY"):
    podman run --rm -d \
      -v /var/lib/dagger \
      --name $CONTAINER_NAME \
      --env HTTP_PROXY={{ http_proxy }} \
      --env HTTPS_PROXY={{ http_proxy }} \
      --privileged \
      registry.dagger.io/engine:latest
