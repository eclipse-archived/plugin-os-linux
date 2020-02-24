# -*-Makefile-*-


UUID = $(shell ./to_uuid.sh)
LINUX_PLUGIN_DIR = /etc/fos/plugins/plugin-os-linux
LINUX_PLUGIN_CONFFILE = /etc/fos/plugins/plugin-os-linux/linux_plugin.json

clean:
	echo "nothing to do..."

all:
	echo "Nothing to do..."


install:


ifeq "$(wildcard $(LINUX_PLUGIN_DIR))" ""
	mkdir -p $(LINUX_PLUGIN_DIR)
	sudo cp -r scripts $(LINUX_PLUGIN_DIR)
	sudo cp linux_plugin $(LINUX_PLUGIN_DIR)
	sudo cp fos_linux.service $(LINUX_PLUGIN_DIR)
	sudo cp linux_plugin.json $(LINUX_PLUGIN_DIR)
else
	sudo cp -r scripts $(LINUX_PLUGIN_DIR)
	sudo cp __init__.py $(LINUX_PLUGIN_DIR)
	sudo cp linux_plugin $(LINUX_PLUGIN_DIR)
	sudo cp fos_linux.service $(LINUX_PLUGIN_DIR)
endif

	sudo cp $(LINUX_PLUGIN_DIR)/fos_linux.service /lib/systemd/system/
	sudo sh -c "echo $(UUID) | xargs -i  jq  '.configuration.nodeid = \"{}\"' $(LINUX_PLUGIN_DIR)/linux_plugin.json > /tmp/os_plugin.tmp && mv /tmp/os_plugin.tmp $(LINUX_PLUGIN_DIR)/linux_plugin.json"