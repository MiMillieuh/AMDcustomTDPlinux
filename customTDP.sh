#!/bin/bash

./ryzenadj --stapm-limit=9000 --fast-limit=25000 --slow-limit=9000 --tctl-temp=90

sleep 30 

sh customTDP.sh
