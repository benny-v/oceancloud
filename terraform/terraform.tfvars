#Project name. Only use a-z A-Z 0-9 and "-" --- NO SPACES OR UNDERSCORES!
name = "project-name-here"

# Digital Ocean region. Options include:
  # nyc1, nyc2, nyc3: New York City, United States
  # ams2, ams3: Amsterdam, the Netherlands
  # sf1, sf2: San Francisco, United States
  # sgp1: Singapore
  # lon1: London, United Kingdom
  # fra1: Frankfurt, Germany
  # tor1: Toronto, Canada
  # blr1: Bangalore, India
region = "nyc1"

# Droplet size. Use one of the following:
  # s-1vcpu-1gb
  # s-1vcpu-2gb
  # s-1vcpu-3gb
  # s-2vcpu-2gb
  # s-3vcpu-1gb
  # s-2vcpu-4gb
  # s-4vcpu-8gb
  # s-6vcpu-16gb
  # s-8vcpu-32gb
  # s-12vcpu-48gb
  # s-16vcpu-64gb
  # s-20vcpu-96gb
  # s-24vcpu-128gb
  # s-32vcpu-192gb
droplet_size = "s-1vcpu-1gb"

# Storage size (in GB) for Nextcloud persistent data (100 = 100GB of Nextcloud storage)
storage_size = "100"

# Database size. Use one of the following:
  # db-s-1vcpu-1gb
  # db-s-1vcpu-2gb
  # db-s-2vcpu-4gb
  # db-s-4vcpu-8gb
  # db-s-6vcpu-16gb
  # db-s-8vcpu-32gb
  # db-s-16vcpu-64gb
database_size = "db-s-1vcpu-1gb"