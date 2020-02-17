# Infrastructure 

This Repo contains YAML CloudFormation Configuration. It creates a custom VPC, 3 Public Subnets in different availability zones in the same region, attached to the VPC. Further, an Internet Gateway is attached to the VPC and
respective Route Table is created and attached as well.

The following parameters are supposed to be supplied while creating the Networking Stack else it wouldn't work:

```
Environment Name
AWS region
VPC's CIDR block
Subnet's CIDR blocks (For all the three Subnets)
```

## Command with Sample Values to create the Networking Stack in dev account:

```
aws --profile dev cloudformation create-stack \
  --stack-name networkingStack \
  --parameters ParameterKey=EnvironmentName,ParameterValue=myVPC \
    ParameterKey=VpcCIDR,ParameterValue=10.25.0.0/16 \
    ParameterKey=PublicSubnet1CIDR,ParameterValue=10.25.10.0/24 \
    ParameterKey=PublicSubnet2CIDR,ParameterValue=10.25.11.0/24 \
    ParameterKey=PublicSubnet3CIDR,ParameterValue=10.25.12.0/24 \
    ParameterKey=vpcRegion,ParameterValue=us-east-1 \
  --template-body file://networking.yaml
```

## Command to delete the Networking Stack:

```
    aws --profile dev cloudformation delete-stack --stack-name networkingStack
```