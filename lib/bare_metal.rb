require 'net/ssh'
require 'net/scp'

module BareMetal
  autoload :FileHelper, 'bare_metal/helpers/file_helper'
  autoload :UserHelper, 'bare_metal/helpers/user_helper'
  autoload :PackageHelper, 'bare_metal/helpers/package_helper'
  autoload :SwapHelper, 'bare_metal/helpers/swap_helper'
  autoload :Machine, 'bare_metal/machine'
end