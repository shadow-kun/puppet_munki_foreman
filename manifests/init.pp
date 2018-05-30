# Class: puppet_munki_foreman
# ===========================
#
# Full description of class puppet_munki_foreman here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'puppet_munki_foreman':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class puppet_munki_foreman (
    $munki_clientidentifier = '',
    $munki_bootstrap = true,
    $munki_suppress_autoinstall = true,
    $munki_suppress_stop  = true,
    $munki_repourl  = 'http://munki/munki_repo'
  ) {
    if $facts['os']['family'] == 'Darwin' {
        class { 'mac_admin::munki':
          repourl             => $munki_repourl,
          suppress_stop       => $munki_suppress_stop,
          suppressautoinstall => $munki_suppress_autoinstall,
          bootstrap           => $munki_bootstrap,
          clientidentifier    => $munki_clientidentifier,
        }
    }

}
