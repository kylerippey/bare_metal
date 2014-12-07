module BareMetal
  module UserHelper
    SUDOERS_FILE = '/etc/sudoers'

    def add_user(username, options={})
      args = []
      args << "--disabled-password"
      args << "--gecos \"\""
      args << username
      args << options[:groups] if options[:groups]

      execute("adduser #{args.join(' ')}")
    end

    def add_sudoer(username, options={})
      if !sudoer?(username)
        passwd = (options[:nopass] ? 'NOPASSWD' : 'ALL')
        execute("echo \"#{username}\tALL=(ALL) #{passwd}:ALL\" | tee -a #{SUDOERS_FILE}")
      end
    end

    def sudoer?(username)
      result = execute("cat #{SUDOERS_FILE} | grep \"#{username}\"")
      result && result.length > 0
    end
  end
end