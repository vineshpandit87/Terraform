provider "aws" {
    region= "us-east-1"
}
resource "aws_iam_user" "myuser"{
    name = "Vinesh"
}
resource "aws_iam_policy" "custompolicy" {
    name = "GlacierEFSEC2"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "glacier:InitiateJob",
                "glacier:AbortMultipartUpload",
                "glacier:GetVaultAccessPolicy",
                "glacier:CreateVault",
                "glacier:DeleteVault",
                "glacier:DescribeVault",
                "glacier:DeleteArchive",
                "glacier:GetJobOutput",
                "glacier:GetVaultNotifications",
                "glacier:DescribeJob",
                "glacier:DeleteVaultNotifications",
                "glacier:GetDataRetrievalPolicy",
                "glacier:SetVaultNotifications",
                "glacier:CompleteMultipartUpload",
                "glacier:InitiateMultipartUpload",
                "glacier:UploadMultipartPart",
                "glacier:PurchaseProvisionedCapacity",
                "glacier:UploadArchive",
                "glacier:GetVaultLock"
            ],
            "Resource": "*"
        }
    ]
}
    EOF
}
resource "aws_iam_policy_attachment" "policyBind"{
    name = "attachment"
    users = [aws_iam_user.myuser.name]
    policy_arn = aws_iam_policy.custompolicy.arn
}