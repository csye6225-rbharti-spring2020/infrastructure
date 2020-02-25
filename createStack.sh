#!/bin/bash

EnvironmentName="myStack"
VpcCIDR="10.25.0.0/16"
PublicSubnet1CIDR="10.25.10.0/24"
PublicSubnet2CIDR="10.25.11.0/24"
PublicSubnet3CIDR="10.25.12.0/24"
vpcRegion="us-east-1"
InstanceTypeParameter="t2.micro"
KeyName="ec2"
Ec2InstanceSize="20"
Ec2InstanceName="myEC2Instance"
Ec2InstanceIAMRole="EC2-CSYE6225"
DBEngine="MySQL"
DBInstanceClass="db.t3.micro"
DBInstanceID="csye6225-spring2020"
DBUsername="myDB"
DBPassword="password"
DBAllocatedStorage="50"
DBName="csye6225"
MultiAZ="false"
DBPublicAccessibility="false"

aws --profile dev cloudformation create-stack \
  --stack-name applicationStack \
  --parameters ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName \
    ParameterKey=VpcCIDR,ParameterValue=$VpcCIDR \
    ParameterKey=PublicSubnet1CIDR,ParameterValue=$PublicSubnet1CIDR \
    ParameterKey=PublicSubnet2CIDR,ParameterValue=$PublicSubnet2CIDR \
    ParameterKey=PublicSubnet3CIDR,ParameterValue=$PublicSubnet3CIDR \
    ParameterKey=vpcRegion,ParameterValue=$vpcRegion \
    ParameterKey=InstanceTypeParameter,ParameterValue=$InstanceTypeParameter \
    ParameterKey=KeyName,ParameterValue=$KeyName \
    ParameterKey=Ec2InstanceSize,ParameterValue=$Ec2InstanceSize \
    ParameterKey=Ec2InstanceName,ParameterValue=$Ec2InstanceName \
    ParameterKey=Ec2InstanceIAMRole,ParameterValue=$Ec2InstanceIAMRole \
    ParameterKey=DBEngine,ParameterValue=$DBEngine \
    ParameterKey=DBInstanceClass,ParameterValue=$DBInstanceClass \
    ParameterKey=DBInstanceID,ParameterValue=$DBInstanceID \
    ParameterKey=DBUsername,ParameterValue=$DBUsername \
    ParameterKey=DBPassword,ParameterValue=$DBPassword\
    ParameterKey=DBAllocatedStorage,ParameterValue=$DBAllocatedStorage \
    ParameterKey=DBName,ParameterValue=$DBName \
    ParameterKey=MultiAZ,ParameterValue=$MultiAZ \
    ParameterKey=DBPublicAccessibility,ParameterValue=$DBPublicAccessibility \
  --template-body file://application.yaml