module BareMetal
  class Machine
    include FileHelper
    include UserHelper
    include PackageHelper
    include SwapHelper

    attr_reader :host, :username

    def initialize(options)
      @host = options.fetch(:host)
      @username = options.fetch(:username)
    end

    def upload(local_path, remote_path, options={})
      scp_client.upload!(local_path, remote_path)

      chown(options[:chown], remote_path) if options[:chown]
      chmod(options[:chmod], remote_path) if options[:chmod]
    end

    def execute(command, options={})
      ssh_client.exec!(command)
    end

    private

    def ssh_client
      @ssh_client ||= Net::SSH.start(host, username)
    end

    def scp_client
      @scp_client ||= Net::SCP.start(host, username)
    end
  end
end