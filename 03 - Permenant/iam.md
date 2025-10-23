---
cssclasses:
  - center-images
  - center-titles
---
Tags: #aws

# IAM

- Use **IAM** to manage access to AWS resources
- Define find-gained access rights :
	- **WHO** can access the resource
	- **WHICH** resources can be accessed by this user/ group
	- **HOW** resources can be accessed


### Essential components
1. IAM User
2. IAM group
3. IAM policy
4. IAM role


##### Which types of access the user is permitted to use
1. Programmic access
2. AWS Management Console access



###  IAM policy 
![[iam policy.png]]



### IAM groups 
- Collection of IAM users
- Used to grant the same permission to multiple users 
- No default group



#### IAM Roles 
- IAM identity with specifi permissions
- Provides temporary permission

![[iam roles arch.png]]


### AWS Organizations
- Enables you to consolidate multiple AWS accounts so that you centrally manage them.
- Group AWS accounts into organizational units (OUs)
- Integration and support for IAM.
- Use service control policy/

###### Service control policies 
- Offers centralized control over accounts.
