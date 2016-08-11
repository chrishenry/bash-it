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
  aws ec2 describe-instances --filter Name=tag:Name,Values=iv-bastion --query 'Reservations[].Instances[].PublicDnsName' | jq  '.[0]' | sed 's/"//g'
}
