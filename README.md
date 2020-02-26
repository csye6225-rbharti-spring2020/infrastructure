# Infrastructure 

This Repo contains YAML CloudFormation Configuration. 

## Command with Sample Values to create the Networking Stack in dev account:

The following parameters are supposed to be supplied while creating the Networking Stack else it wouldn't work!

```
aws --profile dev cloudformation create-stack \
  --stack-name applicationStack \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName \
    ParameterKey=VpcCIDR,ParameterValue=$VpcCIDR \
    ParameterKey=PublicSubnet1CIDR,ParameterValue=$PublicSubnet1CIDR \
    ParameterKey=PublicSubnet2CIDR,ParameterValue=$PublicSubnet2CIDR \
    ParameterKey=PublicSubnet3CIDR,ParameterValue=$PublicSubnet3CIDR \
    ParameterKey=awsRegion,ParameterValue=$awsRegion \
    ParameterKey=InstanceTypeParameter,ParameterValue=$InstanceTypeParameter \
    ParameterKey=KeyName,ParameterValue=$KeyName \
    ParameterKey=Ec2InstanceSize,ParameterValue=$Ec2InstanceSize \
    ParameterKey=Ec2InstanceName,ParameterValue=$Ec2InstanceName \
    ParameterKey=DBEngine,ParameterValue=$DBEngine \
    ParameterKey=DBInstanceClass,ParameterValue=$DBInstanceClass \
    ParameterKey=DBInstanceID,ParameterValue=$DBInstanceID \
    ParameterKey=DBUsername,ParameterValue=$DBUsername \
    ParameterKey=DBPassword,ParameterValue=$DBPassword\
    ParameterKey=DBAllocatedStorage,ParameterValue=$DBAllocatedStorage \
    ParameterKey=DBName,ParameterValue=$DBName \
    ParameterKey=MultiAZ,ParameterValue=$MultiAZ \
    ParameterKey=DBPublicAccessibility,ParameterValue=$DBPublicAccessibility \
    ParameterKey=AMIID,ParameterValue=$AMIID \
    ParameterKey=VpcName,ParameterValue=$VpcName \
  --template-body file://application.yaml
```

## Command to delete the Networking Stack:

```
    aws --profile dev cloudformation delete-stack --stack-name applicationStack
```