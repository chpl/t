terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    github = {
      source = "integrations/github"
    }

    mongodb = {
      source = "mongodb/mongodbatlas"
    }

    azapi = {
      source = "azure/azapi"
    }

    okta = {
      source = "okta/okta"
    }

    databricks = {
      source = "databricks/databricks"
    }

    sonarqube = {
      source = "jdamata/sonarqube"
    }

    cosmo = {
      source = "wundergraph/cosmo"
    }

    datadog = {
      source = "datadog/datadog"
    }

    vault = {
      source = "hashicorp/vault"
    }

    flux = {
      source = "fluxcd/flux"
    }

    lastpass = {
      source = "nrkno/lastpass"
    }

    sops = {
      source = "carlpett/sops"
    }

    tailscale = {
      source = "tailscale/tailscale"
    }

    tfe = {
      source = "hashicorp/tfe"
    }

    grafana = {
      source = "grafana/grafana"
    }

    onepassword = {
      source = "1password/onepassword"
    }
  }
}
