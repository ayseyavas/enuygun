variable "project_id" {
  description = "GCP Proje ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "europe-west1-b"
}

variable "network" {
  description = "Network"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork"
  type        = string
  default     = "default"
}

