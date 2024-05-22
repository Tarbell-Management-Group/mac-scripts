#!/bin/bash
sudo killall PrinterInstallerClient
open $(cat /etc/pl_dir)/service_interface/PrinterInstallerClient.app
