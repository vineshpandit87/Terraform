terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "terraform-statefile-vinesh"
        region = "us-east-1"
        access_key = "AKIAUIABRPA2AZ3EIPFS"
        secret_key = "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"

    }
}