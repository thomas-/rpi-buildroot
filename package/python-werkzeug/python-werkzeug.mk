#############################################################
#
# python-werkzeug
#
#############################################################

PYTHON_WERKZEUG_VERSION = 0.8.3
PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
PYTHON_WERKZEUG_SITE = http://pypi.python.org/packages/source/W/Werkzeug
PYTHON_WERKZEUG_DEPENDENCIES = python

define PYTHON_WERKZEUG_BUILD_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_WERKZEUG_INSTALL_TARGET_CMDS
	(cd $(@D); \
	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
