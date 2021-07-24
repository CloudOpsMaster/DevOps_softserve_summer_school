#!/bin/bash

source config.sh

echo "Enter 1: export (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION=eu-central-1)"
echo "Enter 2: terraform init"
echo "Enter 3: terraform plan"
echo "Enter 4: terraform apply"
echo "Enter 5: terraform destroy"
echo "Enter 6: aws ac2 describe-instances"

read VALUE

case $VALUE in

1)
    echo "export (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION=eu-central-1) "
    export AWS_ACCESS_KEY_ID=$ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY
    export AWS_DEFAULT_REGION=eu-central-1
    echo "Success!"
    ;;

2)
    echo "Terraform init"
    terraform init
    echo "Success!"
    ;;

3)
    echo "Terraform plan"
    terraform plan
    echo "Success!"
    ;;
4)
    echo "Terraform apply"
    terraform apply
    echo "Success!"
    ;;
5)
    echo "Terraform destroy"
    terraform destroy
    echo "Success!"
    ;;
6)
    echo "Describe-instances"
    aws ac2 describe-instances
    echo "Success!"
    ;;

*)
    echo "Incorect value"
    ;;
esac
