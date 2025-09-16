#!/bin/bash
set -e

ACTION=$1

if [ -z "$ACTION" ]; then
  echo "Usage: $0 [init|plan|apply|destroy]"
  exit 1
fi

case $ACTION in
  init)
    terraform init
    ;;
  plan)
    terraform plan
    ;;
  apply)
    terraform apply -auto-approve
    ;;
  destroy)
    terraform destroy -auto-approve
    ;;
  *)
    echo "Invalid action. Use: init|plan|apply|destroy"
    exit 1
    ;;
esac