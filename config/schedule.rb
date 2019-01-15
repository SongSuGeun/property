# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 90.minutes do
  task :delete_tmp_files do
    CarrierWave.clean_cached_files!
    #https://github.com/carrierwaveuploader/carrierwave/wiki/how-to:-delete-cache-garbage-directories
    
    
    #FileUtils.rm_rf Dir.glob("#{Rails.root}/public/uploads/tmp/*")
    #https://stackoverflow.com/questions/19126504/cleanup-tmp-directory-with-carrierwave
    #http://johntopley.com/2006/06/25/rails-tip-5/
  end
end
