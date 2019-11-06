install:

LINUX_PLUGIN_DIR = /etc/fos/plugins/linux
LINUX_PLUGIN_CONFFILE = /etc/fos/plugins/linux/linux_plugin.json

ifeq "$(wildcard $(LINUX_PLUGIN_DIR))" ""
	mkdir -p /etc/fos/plugins/linux/
	sudo cp -r . /etc/fos/plugins/linux/
else
	sudo cp -r scripts /etc/fos/plugins/linux/
	sudo cp __init__.py /etc/fos/plugins/linux/
	sudo cp linux_plugin /etc/fos/plugins/linux/
endif

	sudo cp /etc/fos/plugins/linux/fos_linux.service /lib/systemd/system/