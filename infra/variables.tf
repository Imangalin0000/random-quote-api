variable "image" {
  # BLANK 3 - one plain sentence: what is this value? (M6 checks every variable has one)
  description = "The container image to run, tagged with a full commit SHA"
  type        = string
  # BLANK 4 - your M3 image, tagged with a FULL commit SHA that is in your package.
  # Lowercase owner and repository. Never :latest.
  default = "ghcr.io/inf345/notes-rescue:84921690055cf871e6cfd1c57885a754b4172897"
}

variable "internal_port" {
  description = "The port my service listens on inside the container - the contract's PORT"
  type        = number
  default     = 8080
}

variable "host_port" {
  description = "The port on my laptop: http://localhost:<host_port>/healthz"
  type        = number
  default     = 8080
}

variable "restart_policy" {
  description = "What Docker does when my service exits: no, on-failure, always or unless-stopped"
  type        = string
  default     = "no"
}
