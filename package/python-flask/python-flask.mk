#############################################################
#
# python-flask
#
#############################################################

PYTHON_FLASK_VERSION = 0.9
PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
PYTHON_FLASK_SITE = http://pypi.python.org/packages/source/F/Flask
PYTHON_FLASK_DEPENDENCIES = python python-werkzeug python-jinja2

define PYTHON_FLASK_BUILD_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_FLASK_INSTALL_TARGET_CMDS
	(cd $(@D); \
	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
