# Infrastructure 

This Repo contains YAML CloudFormation Configuration. 

## Command with Sample Values to create the Application Stack in dev account:

The following parameters are supposed to be supplied while creating the Application Stack else it wouldn't work!

```
aws --profile prod cloudformation create-stack \
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
    ParameterKey=AWSAccountID,ParameterValue=$AWSAccountID \
    ParameterKey=CodeDeployComputePlatform,ParameterValue=$CodeDeployComputePlatform \
    ParameterKey=CodeDeployServiceRoleName,ParameterValue=$CodeDeployServiceRoleName \
    ParameterKey=CodeDeployApplicationName,ParameterValue=$CodeDeployApplicationName \
    ParameterKey=CodeDeployDeploymentGroupName,ParameterValue=$CodeDeployDeploymentGroupName \
    ParameterKey=WebAppDeployS3Bucket,ParameterValue=$WebAppDeployS3Bucket \
    ParameterKey=LaunchConfigurationName,ParameterValue=$LaunchConfigurationName \
    ParameterKey=MyAppLoadBalancerName,ParameterValue=$MyAppLoadBalancerName \
    ParameterKey=LoadBalancerTargetName,ParameterValue=$LoadBalancerTargetName \
    ParameterKey=MyDomainName,ParameterValue=$MyDomainName \
    ParameterKey=AutoScalingGroupName,ParameterValue=$AutoScalingGroupName \
    ParameterKey=SSLCertificateArn,ParameterValue=$SSLCertificateArn \
    ParameterKey=SNSTopicName,ParameterValue=$SNSTopicName \
    ParameterKey=LambdaApplicationZipName,ParameterValue=$LambdaApplicationZipName \
    ParameterKey=LambdaFunctionName,ParameterValue=$LambdaFunctionName \
    ParameterKey=SQSQueueName,ParameterValue=$SQSQueueName \
    ParameterKey=DynamoDBName,ParameterValue=$DynamoDBName \
    ParameterKey=MyDomainNameWebapp,ParameterValue=$MyDomainNameWebapp \
  --template-body file://application.yaml
```

## Command to delete the Application Stack:

```
    aws --profile dev cloudformation delete-stack --stack-name applicationStack
```

## Command and steps to generate SSL certificate via Namecheap:

```
    1. Generate a key value pair locally:
        openssl genrsa 2048 > private-key.pem
        openssl req -new -key private-key.pem -out csr.pem
    2. Buy an SSL certificate from Namcheap and add the relevant details including generated public key.
    3. Verify it by DNS, add the key value pair received as CNAME in Route 53 for your domain
    4. Import a new certificate using ACM, provide the validated public key by Namecheap, the private key and the certificate chain
       provided by Namecheap.
```