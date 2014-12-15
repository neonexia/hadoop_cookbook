#
# Cookbook Name:: hadoop
# Library:: hdfs
#
# Copyright © 2014 Cask Data, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module Hadoop
  # Module for HDFS operations
  module Hdfs
    # See if a path exists in HDFS
    #
    # @result Boolean
    def exist?(path)
      cmd = "hdfs dfs -test -e #{path}"
      mso = Mixlib::ShellOut.new(cmd)
      mso.run_command
      Chef::Log.debug("Hadoop::Hdfs.exist? #{path}")
      begin
        cmd.error!
        true
      rescue
        false
      end
    end

    # Determine if an HDFS path is a directory
    #
    # @result Boolean
    def directory?(path)
      cmd = "hdfs dfs -test -d #{path}"
      mso = Mixlib::ShellOut.new(cmd)
      mso.run_command
      Chef::Log.debug("Hadoop::Hdfs.exist? #{path}")
      begin
        cmd.error!
        true
      rescue
        false
      end
    end

    # Determine if an HDFS path is a file
    #
    # @result Boolean
    def file?(path)
      cmd = "hdfs dfs -test -f #{path}"
      mso = Mixlib::ShellOut.new(cmd)
      mso.run_command
      Chef::Log.debug("Hadoop::Hdfs.exist? #{path}")
      begin
        cmd.error!
        true
      rescue
        false
      end
    end
  end
end
