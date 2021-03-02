variable "bucket"{
  description 	= "Name of the S3 bucket. Must be unique"
  type		= string
  default     	= null
}

variable "bucket_prefix"{
  description	= "Creates a unique bucket name beginning with the specified prefix."
  type		= string
  default     	= null
}

variable "request_payer"{
  description 	= "Specifies who should bear the cost of Amazon S3 data transfer."
  type		= string
  default	= "BucketOwner"
}
variable "versioning"{
  description	= "Map containing versioning configuration."
  type		= map(string)
  default	= {}
}

variable "server_side_encryption_configuration"{
  description	= "Map containing server-side encryption configuration."
  type		= any
  default       = {}
}

variable "acl"{
  description	= "ACL to apply"
  type		= string
  default	= "private"
}

variable "policy"{
  description	= "A valid bucket policy JSON document."
  type		= string
  default	= null
}

variable "attach_policy"{
  description	= "Controls if S3 bucket should have bucket policy attached"
  type		= bool
  default	= false
}

variable "lifecycle_rule"{
  description	= "List of maps containing configuration of object lifecycle management."
  type		= any
  default	= []
}

variable "logging"{
  description	= "Map containing access bucket logging configuration."
  type		= map(string)
  default	= {}
}

variable "tags"{
  description 	= "A mapping of tags to assign to the bucket."
  type		= map(string)
  default	= {}
}

variable "acceleration_status"{
  description	= "Sets the accelerate configuration of an existing bucket."
  type 		= string
  default	= "Suspended"
}

variable "attach_public_policy"{
  description	= "Controls if a user defined public bucket policy will be attached"
  type		= bool
  default	= true
}

variable "block_public_acls"{
  description	= "Whether Amazon S3 should block public ACLs for this bucket."
  type		= bool
  default	= false
}

variable "block_public_policy"{
  description	= "Whether Amazon S3 should block public bucket policies for this bucket."
  type		= bool
  default	= false
}

variable "ignore_public_acls"{
  description 	= "Whether Amazon S3 should ignore public ACLs for this bucket."
  type 		= bool
  default	= false
}

variable "restrict_public_buckets"{
  description 	= "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type 		= bool
  default	= false
}

variable "create_bucket"{
  description	= "Controls if S3 bucket should be created"
  type		= bool
  default	= true
}

variable "force_destroy"{
  description	= "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  type		= bool
  default	= false
}

variable "website"{
  description 	= "Map containing static web-site hosting or redirect configuration."
  type		= map(string)
  default	= {}
}

variable "attach_elb_log_delivery_policy"{
  description 	= "Controls if S3 bucket should have ELB log delivery policy attached"
  type		= bool
  default	= false
}
