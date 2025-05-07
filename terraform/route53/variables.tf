variable "aws_region" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "sub_domains" {
  type        = set(string)
  description = "All the sub‑domains to create CNAMEs for"

}

variable "target" {
  type        = string
  description = "The CNAME target (nlb hostname)"
}