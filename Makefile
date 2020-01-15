# -*-Makefile-*-

LINUX_PLUGIN_DIR = /etc/fos/plugins/plugin-os-linux
LINUX_PLUGIN_CONFFILE = /etc/fos/plugins/plugin-os-linux/linux_plugin.json

all:
	echo "Nothing to do..."

install:


ifeq "$(wildcard $(LINUX_PLUGIN_DIR))" ""
	mkdir -p /etc/fos/plugins/plugin-os-linux/
	sudo cp -r . /etc/fos/plugins/plugin-os-linux/
else
	sudo cp -r scripts /etc/fos/plugins/plugin-os-linux/
	sudo cp __init__.py /etc/fos/plugins/plugin-os-linux/
	sudo cp linux_plugin /etc/fos/plugins/plugin-os-linux/
endif

	sudo cp /etc/fos/plugins/plugin-os-linux/fos_linux.service /lib/systemd/system/