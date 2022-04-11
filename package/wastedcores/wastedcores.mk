################################################################################
#
# wastedcores
#
################################################################################

WASTEDCORES_VERSION = master
WASTEDCORES_SITE = git@github.com:sonicyang/wastedcores.git
WASTEDCORES_SITE_METHOD = git

ifeq ($(BR2_PACKAGE_WASTEDCORES_EXTRA),y)
WASTEDCORES_MODULE_MAKE_OPTS = "CFLAGS_sched_profiler.o=-DNUM_CPU=$(BR2_PACKAGE_WASTEDCORES_NUM_CPU) -DMAX_SAMPLE_ENTRIES=$(BR2_PACKAGE_WASTEDCORES_MAX_SAMPLE) -DWITH_SCHEDULING_SAMPLE_EXTRA"
endif
ifeq ($(BR2_PACKAGE_WASTEDCORES_EXTRA),n)
WASTEDCORES_MODULE_MAKE_OPTS = "CFLAGS_sched_profiler.o=-DNUM_CPU=$(BR2_PACKAGE_WASTEDCORES_NUM_CPU) -DMAX_SAMPLE_ENTRIES=$(BR2_PACKAGE_WASTEDCORES_MAX_SAMPLE)"
endif

WASTEDCORES_MODULE_SUBDIRS = tools/sanity_checker_4.4/stap_monitor \
								tools/visualizations_4.4/sched_profiler
WASTEDCORES_DEPENDENCIES = linux

$(eval $(kernel-module))
$(eval $(generic-package))
