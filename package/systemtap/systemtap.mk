################################################################################
#
# systemtap
#
################################################################################

SYSTEMTAP_VERSION = master
SYSTEMTAP_SITE = git://sourceware.org/git/systemtap.git
SYSTEMTAP_SITE_METHOD = git

SYSTEMTAP_DEPENDENCIES = elfutils

SYSTEMTAP_CONF_OPTS += 

$(eval $(autotools-package))
