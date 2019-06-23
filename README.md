# Oceancloud

Oceancloud is an automated and distributed Nextcloud deployment on Digital Ocean, provisioned by [Terraform](https://www.terraform.io/). It leverages Digital Ocean's [managed database service](https://www.digitalocean.com/products/managed-databases/), abstracted [block storage](https://www.digitalocean.com/products/block-storage/) for persistent data, and a simple and immutable [docker droplet](https://marketplace.digitalocean.com/apps/docker) running the official [Nextcloud container](https://hub.docker.com/_/nextcloud), which bootstraps itself to the database and block storage.

## Requirements

[Docker](https://docs.docker.com/install/). That's it!

## How To:

**1.** Copy your [Digital Ocean access token](https://www.digitalocean.com/docs/api/create-personal-access-token/) into the allocated variables at the top of each of the following:
  * `DIGITALOCEAN_TOKEN := abcd1234` in [Makefile](Makefile)
  * `DIGITALOCEAN_TOKEN=abcd1234` in [terraform/user_data.sh](terraform/user_data.sh)

**_DO NOT_ commit your access token to source control for security measures**

**2.** Set your desired variables for the Digital Ocean resources in [terraform/terraform.tfvars](terraform/terraform.tfvars)

**3.** Run `make nextcloud`

_After successfully creating the required resources, an output of the load balancer's IP and database information will be printed to the console._

**4.** In a browser, navigate to the IP address, create your admin account, and add the database info from the aforementioned output.

_Be sure to select PostgresSQL on the setup_

![nextcloudsetup](https://drive.google.com/uc?export=view&id=1T3_swmlIIpTwwIKh5eqKfhbcxPhEQ-1a)

**5.** Enjoy your new micro-service deployment of Nextcloud!

## Using Terraform Remote Backend (recommended)

I recommend using a [Terraform remote backend](https://www.terraform.io/docs/backends/index.html) to remotely store the state of the deployment. This ensures that Terraform's state remains persistent regardless of your local repo.

There is a already a place holder to insert your backend config ([terraform/backend_config.tf](terraform/backend_config.tf))

## Upgrading Nextcloud

Since the app itself is a simple and immutable docker image, simply destroy the droplet and re-run `make nextcloud`. Terraform will detect that the deployment is not in its desired state (since the droplet is now missing) and recreate it, pulling the latest Nextcloud image.

## What's happening under the hood

![cloudcraftdiagram](https://drive.google.com/uc?export=view&id=1k5_2TqiD_zzBDyoPIOGEtiVB2h0-iVFB)

The main advantage of this architecture is that both the database and persistent data are both abstracted from the docker host. The database is provisioned and managed by Digital Ocean, and the persistent data is abstracted and mapped to a separate block storage device via [dostorage](https://github.com/omallo/docker-volume-plugin-dostorage). The Docker droplet now simply pulls and runs the latest stable Nextcloud image, making it completely immutable.
