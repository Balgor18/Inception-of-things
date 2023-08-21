## https://docs.gitlab.com/charts/

# Prerequit
snap install helm --classic

helm repo add gitlab https://charts.gitlab.io/
helm repo update
# helm upgrade --install gitlab gitlab/gitlab \
#   --timeout 600s \
#   --set global.hosts.domain=$HOSTNAME.gitlab.com \
#   --set global.hosts.externalIP=192.168.56.110 \
#   --set certmanager-issuer.email=test@test.com \
  # --set postgresql.image.tag=13.6.0