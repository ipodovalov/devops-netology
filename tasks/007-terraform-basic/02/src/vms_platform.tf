###resources vars
variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Compute intstance's core number"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Compute intstance's memory"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "Compute intstance's core fraction"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Compute intstance's core number"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Compute intstance's memory"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Compute intstance's core fraction"
}
