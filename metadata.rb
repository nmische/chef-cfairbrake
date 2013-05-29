maintainer        "Nathan Mische"
maintainer_email  "nmische@gmail.com"
license           "Apache 2.0"
description       "Installs cfairbrake client component for Airbrake.io."
version           "1.0.0"
recipe            "cfairbrake", "Installs cfairbrake client component for Airbrake.io."
name              "cfairbrake"

%w{ coldfusion10 }.each do |d|
  depends d
end

%w{ ubuntu rhel }.each do |os|
  supports os
end
