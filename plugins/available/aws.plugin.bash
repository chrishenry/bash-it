cite about-plugin
about-plugin 'Helpful AWS tools'

aws-account ()
{
  about 'show the account alias'
  group 'aws'
  aws iam list-account-aliases
}

aws-bastion ()
{
  about 'Public dns of the bastion host'
  group 'aws'
  aws ec2 describe-instances --filter Name=tag:component,Values=bastion --query 'Reservations[].Instances[].PublicDnsName' | jq  '.[0]' | sed 's/"//g'
}

aws-rds ()
{
  about 'Existing RDS instance hostnames'
  group 'aws'
  aws rds describe-db-instances --query "DBInstances[].Endpoint[].Address" | jq  '.[0]' | sed 's/"//g'
}
