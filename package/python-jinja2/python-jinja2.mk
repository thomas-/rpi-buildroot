#############################################################
#
# python-flask
#
#############################################################

PYTHON_JINJA2_VERSION = 2.6
PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
PYTHON_JINJA2_DEPENDENCIES = python

define PYTHON_JINJA2_BUILD_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_JINJA2_INSTALL_TARGET_CMDS
	(cd $(@D); \
	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
