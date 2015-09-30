# encoding : utf-8

class Server < Information
  attr_accessor :ip,
                :location,
                :buy_time,
                :last_restart_time,
                :sys_version,
                :cpu,
                :memory,
                :disk,
                :person
end