# Commands

> Docker

```bash
docker image build --tag juliocesarmidia/http-simple-api:v1.0.0 .

docker container run --rm \
  --name http-simple-api \
  -p 5000:5000 \
  juliocesarmidia/http-simple-api:v1.0.0

docker container run --rm \
  --name http-simple-api \
  -p 5000:5000 \
  --env MESSAGE="$(uptime -s)" \
  juliocesarmidia/http-simple-api:v1.0.0

curl -X GET --silent http://localhost:5000

docker image push juliocesarmidia/http-simple-api:v1.0.0

docker container stop http-simple-api
docker container rm -f http-simple-api
```

> Instance access

```bash
ssh -i ${SSH_KEY} ec2-user@${INSTANCE_IP}

tail -f /var/log/eb-engine.log

docker ps
```

> List stacks for elasticbeanstalk

```bash
aws elasticbeanstalk list-available-solution-stacks
```

> Terraform

```bash
terraform_0.14.3 init

terraform_0.14.3 validate

terraform_0.14.3 refresh

terraform_0.14.3 fmt -write=true -recursive

terraform_0.14.3 plan

terraform_0.14.3 apply -auto-approve

terraform_0.14.3 output

terraform_0.14.3 destroy -auto-approve
```
