#!/usr/bin/env sh

declare -a ecr_logins=(
    "exp,557858491412,us-east-1"
    "stg,591074975537,us-east-1"
    "main,053809551609,us-east-1"
)

for ecr_login in "${ecr_logins[@]}"; do
    profile_name=$(echo "$ecr_login" | cut -f1 -d,)
    account_id=$(echo "$ecr_login" | cut -f2 -d,)
    aws_region=$(echo "$ecr_login" | cut -f3 -d,)
    ecr_url="$account_id.dkr.ecr.$aws_region.amazonaws.com"

    echo "🔄 Logging into $ecr_url"

    aws --profile "$profile_name" --region "$aws_region" ecr get-login-password \
        | docker login --username AWS --password-stdin "$ecr_url"
done
