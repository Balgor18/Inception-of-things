
echo "###################### Creation Cluster ######################"
#  Create the cluster
k3d cluster create ArgonCD 1> /dev/null

echo "###################### Creation Namespace ######################"
# Create both namespace
kubectl create namespace dev
kubectl create namespace argocd

echo "###################### Install ArgoCD ######################"
# Install argocd on pods
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "###################### Deploy script ######################"
# Need to apply the script of deployement

# Boucle while to wait pod ready
# while [[ $(kubectl get pods -n argocd -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True True True True True True" ]]; \
#  do echo "[INFO][ARGOCD]  Waiting all pods to be ready..." && sleep 10; done
#  Erreur que ca donne
#  fcatinauS: E0818 20:07:18.973462    6437 memcache.go:287] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
#    fcatinauS: E0818 20:07:19.025224    6437 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
#    fcatinauS: E0818 20:07:19.042239    6437 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
#    fcatinauS: E0818 20:07:19.048489    6437 memcache.go:121] couldn't get resource list for metrics.k8s.io/v1beta1: the server is currently unable to handle the request
echo "[INFO][ARGOCD] Done"

# k apply -f application.yaml

# https://github.com/Balgor18/viporten_IOT_P3.git # Project link