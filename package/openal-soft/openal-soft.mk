#############################################################
#
# OpenAL Soft
#
#############################################################
OPENAL_SOFT_VERSION = fd83e00
OPENAL_SOFT_SITE = git://repo.or.cz/openal-soft.git
OPENAL_SOFT_INSTALL_STAGING = YES
OPENAL_SOFT_INSTALL_TARGET = YES

OPENAL_SOFT_CONF_OPT = -DCMAKE_BUILD_TYPE=Release -DEXAMPLES=OFF

ifneq ($(BR2_PACKAGE_OPENAL_SOFT_ALSA),y)
OPENAL_SOFT_CONF_OPT += -DALSA=ON
else
OPENAL_SOFT_CONF_OPT += -DALSA=OFF
endif

ifneq ($(BR2_PACKAGE_OPENAL_SOFT_OSS),y)
OPENAL_SOFT_CONF_OPT += -DOSS=ON
else
OPENAL_SOFT_CONF_OPT += -DOSS=OFF
endif

ifneq ($(BR2_PACKAGE_OPENAL_SOFT_UTILS),y)
OPENAL_SOFT_CONF_OPT += -DUTILS=OFF
endif

$(eval $(cmake-package))
