module BareMetal
  module PackageHelper
    def installed?(package)
      installed_packages.include?(package)
    end

    def install(*packages)
      # Exclude any packages that are already installed
      packages.reject! {|package| installed?(package)}

      return unless packages.length > 0

      execute("export DEBIAN_FRONTEND=noninteractive")
      execute("apt-get -y install #{packages.join(' ')}")

      # Clear installed_packages cache
      @installed_packages = nil
    end

    def installed_packages
      @installed_packages ||= begin
        install_string = execute("dpkg --get-selections | grep -v deinstall")
        install_string.gsub("install", '').gsub("\t", '').split("\n")
      end
    end
  end
end