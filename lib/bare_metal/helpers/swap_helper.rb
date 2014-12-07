module BareMetal
  module SwapHelper
    def allocate_swap_space(size)
      return if file_exists?('/swapfile')

      execute("fallocate -l #{size} /swapfile")
      execute('chmod 600 /swapfile')
      execute('mkswap /swapfile')
      execute('swapon /swapfile')
    end
  end
end