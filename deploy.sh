docker build -t pushparajakln/multi-client:latest -t pushparajakln/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t pushparajakln/multi-server:latest -t pushparajakln/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t pushparajakln/multi-worker:latest -t pushparajakln/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push pushparajakln/multi-client:latest
docker push pushparajakln/multi-server:latest
docker push pushparajakln/multi-worker:latest

docker push pushparajakln/multi-client:$SHA
docker push pushparajakln/multi-server:$SHA
docker push pushparajakln/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=pushparajakln/multi-server:$SHA
kubectl set image deployments/client-deployment server=pushparajakln/multi-client:$SHA
kubectl set image deployments/worker-deployment server=pushparajakln/multi-worker:$SHA