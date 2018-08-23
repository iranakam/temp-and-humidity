require './app'
require 'unicorn/worker_killer'

max_request_min =  ENV['UNICORN_MAX_REQUEST_MIN']&.to_i || 3072
max_request_max =  ENV['UNICORN_MAX_REQUEST_MAX']&.to_i || 4096

use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

oom_min = ((ENV['UNICORN_OOM_MIN']&.to_i || 250) * (1024**2))
oom_max = ((ENV['UNICORN_OOM_MAX']&.to_i || 300) * (1024**2))

use Unicorn::WorkerKiller::Oom, oom_min, oom_max

run Application
