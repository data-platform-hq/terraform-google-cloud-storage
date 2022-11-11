terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.24.0"
    }
    airflow = {
      source  = "DrFaust92/airflow"
      version = "0.7.0"
    }
  }
}
