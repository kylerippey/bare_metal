module BareMetal
  module FileHelper
    def file_exists?(path)
      !execute("ls -lh #{path}").include?("No such file or directory")
    end

    def mkdir(remote_path, options={})
      execute("mkdir -p #{remote_path}")

      chown(options[:chown], remote_path) if options[:chown]
      chmod(options[:chmod], remote_path) if options[:chmod]
    end

    def cp(source_path, dest_path)
      execute("cp #{source_path} #{dest_path}")
    end

    def rm(remote_path)
      execute("rm -rf #{remote_path}")
    end

    def chown(permissions, remote_path)
      execute("chown -R #{permissions} #{remote_path}")
    end

    def chmod(user, remote_path)
      execute("chmod #{user} #{remote_path}")
    end

    def symlink(source_path, remote_path)
      execute("ln -s #{source_path} #{remote_path}")
    end
  end
end