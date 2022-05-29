# Login to AWS ECR
docker login -u AWS -p $(aws ecr get-login-password --region eu-central-1) 616132893387.dkr.ecr.eu-central-1.amazonaws.com

# Build Tag and Push client
docker build -t client ./client
docker tag client:latest 616132893387.dkr.ecr.eu-central-1.amazonaws.com/client:latest
docker push 616132893387.dkr.ecr.eu-central-1.amazonaws.com/client:latest


# Build Tag and Push server
docker build -t server ./server
docker tag server:latest 616132893387.dkr.ecr.eu-central-1.amazonaws.com/server:latest
docker push 616132893387.dkr.ecr.eu-central-1.amazonaws.com/server:latest

OLD_TASK_ID=$(aws ecs list-tasks --cluster whist-ec2 --desired-status RUNNING --family whist-td | egrep "task/" | sed -E "s/.*task\/(.*)\"/\1/")
aws ecs stop-task --cluster whist-ec2 --task ${OLD_TASK_ID}
# # Deploy service with the new Task Definition
# ecs-deploy -c whist-ec2 -n whist-srv -i ignore --skip-deployments-check