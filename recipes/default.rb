#
# Cookbook:: teraterm
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

uri = ::URI.parse("https://osdn.net/frs/redir.php?m=xtom_us&f=ttssh2%2F71232%2Fteraterm-4.103.exe")
cache_file_path = File.join(Chef::Config[:file_cache_path], File.basename(::URI.unescape(uri.path)))


remote_file cache_file_path do
    source  URI       
    action  :create 
end


windows_package "Install Terraterm" do
     source cache_file_path
     installer_type :custom
     options '/SILENT'
     action :install
end
