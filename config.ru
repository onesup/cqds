# This file is used by Rack-based servers to start the application.
# require 'rack/iframe'
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
# use Rack::Iframe# , :p3p => %('P3P:CP="IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT"')