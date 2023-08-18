
echo "###################### Creation Cluster ######################"
#  Create the cluster
k3d cluster create ArgonCD 1> /dev/null

echo "###################### Creation Namespace ######################"
# Create both namespace
k create namespace dev
k create namespace ArgoCD

echo "###################### Install ArgoCD ######################"
# Install argocd on pods
k apply -n ArgoCD -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "###################### Deploy script ######################"
# Need to apply the script of deployement

# https://github.com/Balgor18/viporten_IOT_P3.git # Project link