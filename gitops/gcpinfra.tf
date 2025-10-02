# GCP infrastrcute code as terrform file
# Configure the Google Cloud provider
provider "google" {
  #project = "your-gcp-project-id" # Replace with your GCP Project ID
  region  = "us-central1"         # Replace with your desired region
}

# Create a Google Compute Engine VM instance
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-gcp-vm"
  machine_type = "e2-medium" # Or another desired machine type
  zone         = "us-central1-a" # Or another desired zone within the region

  # Define the boot disk
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Or another desired image
    }
  }

  # Define the network interface
  network_interface {
    network = "default" # Use the default VPC network
    access_config {
      # This block allows for an external IP address
    }
  }

}
